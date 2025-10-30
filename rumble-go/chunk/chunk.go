package chunk

import (
	"encoding/binary"
	"encoding/hex"
	"fmt"
	"io"
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

// func ParseSubChunks(c *Chunk) []Chunk {

// 	switch c.FourCC {
// 	case "SHOC":
// 		return ParseShoc(c)
// 	default:
// 		panic(fmt.Sprintf("Parsing not implemented for chunk type '%s'", c.FourCC))
// 	}
// }

func Print(c TopLevelChunk, doHex bool) {
	fmt.Printf(" %d | %#x | %s | (%d / %#x bytes)\n", c.Index(), c.StartAddress(), c.FourCC(), c.TotalSize())
	if doHex {
		fmt.Println(hex.Dump(c.Data()))
	}
}

func readTopLevelChunk(r io.ReadSeeker) (TopLevelChunk, error) {
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
		return readCTRLChunk(r, startPos)
	case "SHOC":
		return readSHOCChunk(r, startPos)
	case "FILL":
		return readFILLChunk(r, startPos, pos)
	default:
		panic("Unrecognized top level chunk: " + fourcc)
	}
}

func readCTRLChunk(r io.ReadSeeker, startPos uint32) (TopLevelChunk, error) {
	var chunkSize uint32
	if err := binary.Read(r, binary.LittleEndian, &chunkSize); err != nil {
		return nil, err
	}

	data := make([]byte, chunkSize-8)
	if _, err := io.ReadFull(r, data); err != nil {
		return nil, err
	}

	return &Ctrl{
		index:        0,
		fourCC:       "CTRL",
		startAddress: startPos,
		data:         data,
	}, nil
}

func readSHOCChunk(r io.ReadSeeker, startPos uint32) (*Shoc, error) {
	var chunkSize uint32
	if err := binary.Read(r, binary.LittleEndian, &chunkSize); err != nil {
		return nil, err
	}

	data := make([]byte, chunkSize-8)
	if _, err := io.ReadFull(r, data); err != nil {
		return nil, err
	}

	return &Shoc{
		index:        0,
		fourCC:       "SHOC",
		startAddress: startPos,
		data:         data,
	}, nil
}

func readFILLChunk(r io.ReadSeeker, startPos uint32, pos int64) (TopLevelChunk, error) {
	// Handle special case: fill tag ends on 0x6000 boundary
	if pos%0x6000 == 0 {
		return &Fill{
			fourCC:       "FILL",
			startAddress: startPos,
			data:         []byte{},
		}, nil
	}

	// Normal FILL parsing

	var chunkSize uint32
	if err := binary.Read(r, binary.LittleEndian, &chunkSize); err != nil {
		return nil, err
	}

	data := make([]byte, chunkSize-8)

	if _, err := io.ReadFull(r, data); err != nil {
		return nil, err
	}

	return &Fill{
		fourCC:       "FILL",
		startAddress: startPos,
		data:         data,
	}, nil
}
