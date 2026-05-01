package o3d

import (
	"encoding/binary"
	"fmt"
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
}

// Element Texture/Translation?
type ELTL struct {
}

// Raw element Data: mostly VIF + some texture/other metadata
type ELDA struct {
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

		} else if chunkTypeCheck == 1 {

			if currentObfChunk.ELTL != nil {
				panic("ELTL NOT NIL")
			}
			if chunk.MagicString() != "ELTL" {
				panic("NOT AN ELTL!")
			}

		} else if chunkTypeCheck == 2 {
			if currentObfChunk.ELDA != nil {
				panic("ELDA NOT NIL")
			}
			if chunk.MagicString() != "ELDA" {
				panic("NOT AN ELDA!")
			}

		}

		fmt.Println(chunkIndex)
		chunks = append(chunks, currentObfChunk)
		offset = chunkEnd
		chunkIndex++
	}

	if (len(chunks) % 3) != 0 {
		panic("CHUNKS NOT DIVISIBLE BY 3!")
	}

	return chunks, nil
}
