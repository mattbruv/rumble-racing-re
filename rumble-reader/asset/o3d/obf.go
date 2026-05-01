package o3d

type Obf struct {
	rawData []byte

	RawObfChunks []ObfChunk
	RootNode     *ObfNode
}

type ObfNode struct {
	metadata ObfChunk

	Parent      *ObfNode // 0x1C
	LastChild   *ObfNode // 0x20
	PrevSibling *ObfNode // 0x24
	Child       *ObfNode // 0x28

}

func parseObf(buf []byte) (*Obf, error) {
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
	node.metadata = data[currDataIndex]

	// TODO: extract texture data
	// .....

	nodeCount := 1

	if node.metadata.ELHE.ChildCount != 0 {
		var lastChild *ObfNode
		nextDataIndex := currDataIndex + 1

		for i := 0; i < int(node.metadata.ELHE.ChildCount); i++ {
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
