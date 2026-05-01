package o3d

import (
	"encoding/binary"
	"fmt"
	"math"
	"rumble-reader/helpers"
)

type Chunk struct {
	Magic   [4]byte
	Size    uint32
	Payload []byte
}

func (c Chunk) MagicString() string {
	return string(c.Magic[:])
}

func parseChunks(data []byte) ([]Chunk, error) {
	var chunks []Chunk
	offset := 0
	for offset < len(data) {
		if offset+8 > len(data) {
			return nil, fmt.Errorf("incomplete chunk header at offset %d", offset)
		}
		var magic [4]byte
		copy(magic[:], data[offset:offset+4])
		size := binary.LittleEndian.Uint32(data[offset+4 : offset+8])
		if size < 8 {
			return nil, fmt.Errorf("invalid chunk size %d for %q", size, magic)
		}
		chunkEnd := offset + int(size)
		if chunkEnd > len(data) {
			return nil, fmt.Errorf("chunk %q size %d exceeds remaining data", magic, size)
		}
		payload := data[offset:chunkEnd]

		helpers.ReverseBytesInPlace(magic[:])

		chunks = append(chunks, Chunk{
			Magic:   magic,
			Size:    size,
			Payload: payload,
		})
		offset = chunkEnd
	}
	return chunks, nil
}

// Element Header?
type ELHE struct {
	Raw Chunk

	// Relevant Ghidra RE struct data:
	childCount       uint16 // 0x00
	maybeNumTextures int    // 0x02
	unk2             uint16 // 0x06

	X float32 // 0x48
	Y float32 // 0x4C
	Z float32 // 0x50
	W float32 // 0x54
}

// Element Texture/Translation?
type ELTL struct {
	Raw Chunk
}

// Raw element Data: mostly VIF + some texture/other metadata
type ELDA struct {
	Raw Chunk
}

type ObfChunk struct {
	ELHE *ELHE
	ELTL *ELTL
	ELDA *ELDA
}

func parseObfChunks(data []byte) ([]ObfChunk, error) {
	var chunks []ObfChunk
	offset := 0

	currentObfChunk := ObfChunk{}
	chunkIndex := 0

	// fmt.Println(hex.Dump(data))
	for offset < len(data) {
		if offset+8 > len(data) {
			return nil, fmt.Errorf("incomplete chunk header at offset %d", offset)
		}
		var magic [4]byte
		copy(magic[:], data[offset:offset+4])

		size := binary.LittleEndian.Uint32(data[offset+4 : offset+8])
		// fmt.Println("FUCKIN OFFSET: ", offset, "SIZE:", size)

		// if size < 8 {
		// 	return nil, fmt.Errorf("invalid chunk size %d for %q", size, magic)
		// }
		chunkEnd := offset + int(size) + 8
		if chunkEnd > len(data) {
			return nil, fmt.Errorf("chunk %q size %d exceeds remaining data", magic, size)
		}
		payload := data[offset:chunkEnd]

		// If the chunk is HEAD, ignore it
		chunk := Chunk{
			Magic:   magic,
			Size:    size,
			Payload: payload,
		}

		// Ignore HEAD chunk, skip past it
		if chunk.MagicString() == "HEAD" {
			offset = chunkEnd
			continue
		}

		chunkTypeCheck := chunkIndex % 3

		if chunkTypeCheck == 0 {
			if currentObfChunk.ELHE != nil {
				panic("ELHE NOT NIL")
			}
			if chunk.MagicString() != "ELHE" {
				panic("NOT AN ELHE!")
			}

			elhe, err := parseELHE(chunk)
			if err != nil {
				panic("FUCK!")
			}
			currentObfChunk.ELHE = elhe

		} else if chunkTypeCheck == 1 {

			if currentObfChunk.ELTL != nil {
				panic("ELTL NOT NIL")
			}
			if chunk.MagicString() != "ELTL" {
				panic("NOT AN ELTL!")
			}

			eltl, err := parseELTL(chunk)
			if err != nil {
				panic("FUCK!")
			}
			currentObfChunk.ELTL = eltl

		} else if chunkTypeCheck == 2 {
			if currentObfChunk.ELDA != nil {
				panic("ELDA NOT NIL")
			}
			if chunk.MagicString() != "ELDA" {
				panic("NOT AN ELDA!")
			}

			elda, err := parseELDA(chunk)
			if err != nil {
				panic("FUCK!")
			}
			currentObfChunk.ELDA = elda
		}

		offset = chunkEnd
		chunkIndex++

		// fmt.Println(chunkIndex)
		if currentObfChunk.ELDA != nil && currentObfChunk.ELHE != nil && currentObfChunk.ELTL != nil {
			chunks = append(chunks, currentObfChunk)
			// fmt.Println("RESET")
			currentObfChunk = ObfChunk{}
		}
	}

	return chunks, nil
}

func parseELHE(chunk Chunk) (*ELHE, error) {
	base := 0x8
	elhe := ELHE{
		Raw:              chunk,
		childCount:       binary.LittleEndian.Uint16(chunk.Payload[base : base+2]),
		maybeNumTextures: int(binary.LittleEndian.Uint32(chunk.Payload[base+0x2 : base+0x2+4])),
		unk2:             binary.LittleEndian.Uint16(chunk.Payload[base+0x6 : base+0x6+2]),
		X:                math.Float32frombits(binary.LittleEndian.Uint32(chunk.Payload[base+0x48 : base+0x48+4])),
		Y:                math.Float32frombits(binary.LittleEndian.Uint32(chunk.Payload[base+0x4C : base+0x4C+4])),
		Z:                math.Float32frombits(binary.LittleEndian.Uint32(chunk.Payload[base+0x50 : base+0x50+4])),
		W:                math.Float32frombits(binary.LittleEndian.Uint32(chunk.Payload[base+0x54 : base+0x54+4])),
	}

	return &elhe, nil
}

func parseELTL(chunk Chunk) (*ELTL, error) {
	eltl := ELTL{
		Raw: chunk,
	}

	return &eltl, nil
}

func parseELDA(chunk Chunk) (*ELDA, error) {
	elda := ELDA{
		Raw: chunk,
	}

	return &elda, nil
}
