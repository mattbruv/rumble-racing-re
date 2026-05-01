package o3d

type Obf struct {
	rawData []byte

	RawObfChunks []ObfChunk
	RootNode     *ObfNode
}

type ObfNodeJson struct {
	Metadata NodeMetadata   `json:"metadata"`
	Children []*ObfNodeJson `json:"children,omitempty"`
}

type NodeMetadata struct {
	X float32
	Y float32
	Z float32
	W float32

	DataLen      int
	HeaderOffset int
	NumTextures  uint16
}

type ObfNode struct {
	RawChunk ObfChunk
	Metadata NodeMetadata

	Parent      *ObfNode // 0x1C
	LastChild   *ObfNode // 0x20
	PrevSibling *ObfNode // 0x24
	Child       *ObfNode // 0x28
}

func ParseObf(buf []byte) (*Obf, error) {
	obfAsset := Obf{
		rawData:  buf,
		RootNode: &ObfNode{},
	}

	// Skip past the .Obf header, like the game does
	obfBytes := buf[0x18:]

	// fmt.Println(hex.Dump(obfBytes))
	// fmt.Println("PARSE OBF CHUNKS")

	chunks, err := parseObfChunks(obfBytes)
	if err != nil {
		return nil, err
	}

	obfAsset.RawObfChunks = chunks

	buildTree(obfAsset.RootNode, 0, chunks)

	return &obfAsset, nil
}

func buildTree(node *ObfNode, currDataIndex int, data []ObfChunk) int {
	node.RawChunk = data[currDataIndex]

	node.Metadata.X = node.RawChunk.ELHE.X
	node.Metadata.Y = node.RawChunk.ELHE.Y
	node.Metadata.Z = node.RawChunk.ELHE.Z
	node.Metadata.W = node.RawChunk.ELHE.W
	node.Metadata.DataLen = int(len(node.RawChunk.ELDA.Raw.Payload))
	node.Metadata.HeaderOffset = node.RawChunk.ELHE.Raw.Offset
	node.Metadata.NumTextures = node.RawChunk.ELHE.MaybeNumTextures

	// TODO: extract texture data
	// .....

	nodeCount := 1

	if node.RawChunk.ELHE.ChildCount != 0 {
		var lastChild *ObfNode
		nextDataIndex := currDataIndex + 1

		for i := 0; i < int(node.RawChunk.ELHE.ChildCount); i++ {
			childNode := &ObfNode{}
			childNode.Parent = node

			if i == 0 {
				childNode.PrevSibling = nil
			} else {
				childNode.PrevSibling = lastChild
			}
			lastChild = childNode
			node.LastChild = childNode

			childNodeCount := buildTree(childNode, nextDataIndex, data)
			nextDataIndex += childNodeCount
			nodeCount += childNodeCount
		}
	}

	return nodeCount
}

func NodeToJson(node *ObfNode) *ObfNodeJson {
	j := &ObfNodeJson{
		Metadata: node.Metadata,
	}
	child := node.LastChild
	for child != nil {
		j.Children = append(j.Children, NodeToJson(child))
		child = child.PrevSibling
	}
	return j
}
