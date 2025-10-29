package main

import (
	"encoding/binary"
	"fmt"
	"io"
)

type Chunk struct {
	FourCC          string
	ChunkSize       uint32
	OffsetBeginning int64
	Data            []byte
}

func (c *Chunk) print() {
	fmt.Printf("%#x | %s | (%d / %#x bytes)\n", c.OffsetBeginning, c.FourCC, c.ChunkSize, c.ChunkSize)
}

func readChunk(r io.ReadSeeker) (chunk Chunk, err error) {
	startPos, _ := r.Seek(0, io.SeekCurrent)

	var tag [4]byte
	if _, err = io.ReadFull(r, tag[:]); err != nil {
		return Chunk{}, err
	}

	// Reverse FOURCC bytes since it's stored little-endian
	for i := 0; i < 2; i++ {
		tag[i], tag[3-i] = tag[3-i], tag[i]
	}

	fourcc := string(tag[:])

	pos, _ := r.Seek(0, io.SeekCurrent)

	// If this is a FILL chunk on a 0x6000 boundary, just return no data
	if fourcc == "FILL" && ((pos % 0x6000) == 0) {
		return Chunk{
			FourCC:          fourcc,
			OffsetBeginning: startPos,
			ChunkSize:       0,
			Data:            make([]byte, 0),
		}, err
	}

	var chunkSize uint32
	var data []byte

	// read chunk size in bytes (second u32)
	if err = binary.Read(r, binary.LittleEndian, &chunkSize); err != nil {
		return Chunk{}, err
	}

	dataSize := chunkSize - 8

	data = make([]byte, dataSize)

	if _, err = io.ReadFull(r, data); err != nil {
		return Chunk{}, err
	}

	// fmt.Println(hex.Dump(data))

	// fmt.Printf("Size (data): %d\n", len(data))
	// fmt.Printf("Size (decimal): %d\n", chunkSize)

	return Chunk{
		FourCC:          fourcc,
		OffsetBeginning: startPos,
		ChunkSize:       chunkSize,
		Data:            data,
	}, nil
	// return fourcc, chunkSize, data, nil
}
