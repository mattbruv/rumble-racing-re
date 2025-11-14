package txf

import (
	"encoding/binary"
	"fmt"
)

type HEAD struct {
}

type ZTHE struct {
}
type CLHE struct {
}
type TXDA struct {
}

type CLDA struct {
}

// TXF seems to contain
type TXF struct {
	rawData []byte

	Header HEAD
	ZTHEs  []ZTHE
	CLHEs  CLHE
}

func ParseTXF(buf []byte) (*TXF, error) {
	resource := TXF{
		rawData: buf,
	}

	chunks, err := splitTaggedChunks(buf[8:])

	if err != nil {
		panic(err)
	}

	for chunkIndex, chunk := range chunks {
		fmt.Println(chunkIndex, len(chunk), string(chunk[0:4]))

	}

	return &resource, nil
}

// Splits binary stream into chunks: [4-byte tag][4-byte size][size bytes of data]
func splitTaggedChunks(buf []byte) ([][]byte, error) {
	var chunks [][]byte
	offset := 0

	for offset+8 <= len(buf) {
		tag := buf[offset : offset+4]
		// fmt.Println(string(tag))
		size := binary.LittleEndian.Uint32(buf[offset+4 : offset+8])
		offset += 8

		if offset+int(size) > len(buf) {
			return nil, fmt.Errorf("invalid size %d at offset %d", size, offset)
		}

		data := buf[offset : offset+int(size)]
		offset += int(size)

		// Make a new binary chunk: tag + size + data
		chunk := make([]byte, 0, 8+len(data))
		chunk = append(chunk, tag...)
		chunk = append(chunk,
			buf[offset-int(size)-4:offset-int(size)]..., // size
		)
		chunk = append(chunk, data...)

		chunks = append(chunks, chunk)
	}

	return chunks, nil
}
