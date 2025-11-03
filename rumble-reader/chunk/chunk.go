package chunk

import (
	"encoding/hex"
	"fmt"
	"io"
	"rumble-reader/chunk/shoc"
)

type Chunk interface {
	FourCC() string
	TotalSize() uint32
	StartAddress() uint32
	Data() []byte
}

type TopLevelChunk interface {
	Chunk
	Index() uint32
}

func Print(c TopLevelChunk, doHex bool) {
	fmt.Printf(" %d | %#x | %s | (%d / %#x bytes)\n", c.Index(), c.StartAddress(), c.FourCC(), c.TotalSize(), c.TotalSize())
	if doHex {
		fmt.Println(hex.Dump(c.Data()))
	}
}

func readTopLevelChunk(r io.ReadSeeker, chunkIndex uint32) (TopLevelChunk, error) {
	startPosSigned, _ := r.Seek(0, io.SeekCurrent)
	startPos := uint32(startPosSigned)

	tag := make([]byte, 4)
	if _, err := io.ReadFull(r, tag); err != nil {
		return nil, err
	}

	// Reverse bytes if little-endian
	for i := 0; i < 2; i++ {
		tag[i], tag[3-i] = tag[3-i], tag[i]
	}
	fourcc := string(tag)

	pos, _ := r.Seek(0, io.SeekCurrent)

	switch fourcc {
	case "CTRL":
		return readCTRLChunk(r, startPos, chunkIndex)
	case "SHOC":
		return shoc.ReadSHOCChunk(r, startPos, chunkIndex)
	case "FILL":
		return readFILLChunk(r, startPos, pos, chunkIndex)
	default:
		return readGenericChunk(r, fourcc, startPos, chunkIndex)
	}
}
