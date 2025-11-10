package asset

import (
	"encoding/binary"
	"fmt"
	"os"
	"unsafe"
)

// Node holds the parsed info for one element in the tree.
type Node struct {
	Offset       int64
	ChildCount   uint16
	ClutCount    uint16
	HeaderFloats [4]float32
	CurrentVal   uint32
	AddAmount    uint32
	PuVar10      uint32
	Children     []Node
}

// readU16 reads a little-endian uint16.
func readU16(b []byte, offset int64) uint16 {
	return binary.LittleEndian.Uint16(b[offset : offset+2])
}

// readU32 reads a little-endian uint32.
func readU32(b []byte, offset int64) uint32 {
	return binary.LittleEndian.Uint32(b[offset : offset+4])
}

// readF32 reads a little-endian float32.
func readF32(b []byte, offset int64) float32 {
	bits := binary.LittleEndian.Uint32(b[offset : offset+4])
	return float32FromBits(bits)
}

// helper for float conversion
func float32FromBits(b uint32) float32 { return *(*float32)(unsafe.Pointer(&b)) }

// OL_iReadElementsAndSonAndBuildTree simulates the recursive parser.
func OL_iReadElementsAndSonAndBuildTree(data []byte, base int64) Node {
	var n Node
	n.Offset = base

	// Read counts (matches shorts at header+0, +2)
	n.ChildCount = readU16(data, base)
	n.ClutCount = readU16(data, base+2)

	// Simulate header at base+0x48..+0x54 (floats)
	for i := 0; i < 4; i++ {
		n.HeaderFloats[i] = readF32(data, base+0x48+int64(i*4))
	}

	// streamPtr := base + 0x60
	streamPtr := base + 0x60

	// read currentNodeVal and addAmount
	n.AddAmount = readU32(data, streamPtr+4)
	n.CurrentVal = readU32(data, streamPtr+8)

	// skip addAmount + 8 bytes
	streamPtr += int64(n.AddAmount) + 8

	// read puVar5[10]
	n.PuVar10 = readU32(data, streamPtr)

	// move past texture/CLUT area if any
	streamPtr += 4

	// recursively read children
	for i := 0; i < int(n.ChildCount); i++ {
		child := OL_iReadElementsAndSonAndBuildTree(data, streamPtr)
		n.Children = append(n.Children, child)

		// estimate child size: child end - start (simplified)
		streamPtr = child.Offset + 0x70 // heuristic: each node roughly 0x70 bytes
	}

	return n
}

func ParseO3d() {
	file := "../test.o3d"
	data, err := os.ReadFile(file)
	if err != nil {
		panic(err)
	}

	// The first Obf block starts at offset 0x70 + 0x10 = 0x80
	root := OL_iReadElementsAndSonAndBuildTree(data, 0xa0)

	var printNode func(Node, int)
	printNode = func(n Node, depth int) {
		indent := ""
		for i := 0; i < depth; i++ {
			indent += "  "
		}
		fmt.Printf("%sNode@0x%X  children=%d  cluts=%d  floats=%v  current=0x%X puVar10=0x%X\n",
			indent, n.Offset, n.ChildCount, n.ClutCount, n.HeaderFloats, n.CurrentVal, n.PuVar10)
		for _, c := range n.Children {
			printNode(c, depth+1)
		}
	}

	printNode(root, 0)
}
