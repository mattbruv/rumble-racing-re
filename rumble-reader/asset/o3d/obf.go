package o3d

import "fmt"

type Obf struct {
	rawData []byte

	RawObfChunks []ObfChunk
	RootNode     *ObfNode
}

type ObfNode struct {
	X float32 // 0x0
	Y float32 // 0x4
	Z float32 // 0x8
	W float32 // 0xC

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

	totalNodes := buildTree(obfAsset.RootNode, 0, chunks)
	fmt.Println("TOTAL NODES: ", totalNodes)
	fmt.Println("X: ", obfAsset.RootNode.X)

	return &obfAsset, nil
}

func buildTree(node *ObfNode, currDataIndex int, data []ObfChunk) int {
	meta := data[currDataIndex]

	node.X = meta.ELHE.X
	node.Y = meta.ELHE.Y
	node.Z = meta.ELHE.Z
	node.W = meta.ELHE.W

	// *node = ObfNode{

	// 	Parent:      node.Parent,
	// 	LastChild:   &ObfNode{},
	// 	PrevSibling: &ObfNode{},
	// 	Child:       &ObfNode{},
	// }

	// panic("unimplemented")
	return 1
}
