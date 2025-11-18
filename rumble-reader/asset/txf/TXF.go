package txf

import (
	"encoding/binary"
	"errors"
	"fmt"
)

// TXF seems to contain
type TXF struct {
	rawData []byte

	Header *HEAD

	TextureHeaders []*ZTHE
	CLUTHeader     *CLHE

	TextureData *TXDA
	CLUTData    *CLDA
}

func ParseTXF(buf []byte) (*TXF, error) {
	txfAsset := TXF{
		rawData: buf,
	}

	chunks, err := splitTaggedChunks(buf[8:])

	if err != nil {
		panic(err)
	}

	for _, chunk := range chunks {
		// fmt.Println(chunkIndex, len(chunk), string(chunk[0:4]))
		tag := string(chunk[0:4])

		switch tag {
		case "HEAD":
			{
				if head, err := parseHEAD(chunk); err == nil {
					if txfAsset.Header != nil {
						return nil, errors.New("multiple HEAD in TXF file")
					}
					txfAsset.Header = head
				}
			}
		case "ZTHE":
			{
				if zthe, err := parseZTHE(chunk); err == nil {
					txfAsset.TextureHeaders = append(txfAsset.TextureHeaders, zthe)
				}
			}
		case "CLHE":
			if clhe, err := parseCLHE(chunk); err == nil {
				if txfAsset.CLUTHeader != nil {
					return nil, errors.New("multiple CLHE in TXF file")
				}
				txfAsset.CLUTHeader = clhe
			}
		case "TXDA":
			if txda, err := parseTXDA(chunk); err == nil {
				if txfAsset.TextureData != nil {
					return nil, errors.New("multiple TXDA in TXF file")
				}
				txfAsset.TextureData = txda
			}
		case "CLDA":
			if clda, err := parseCLDA(chunk); err == nil {
				if txfAsset.CLUTData != nil {
					return nil, errors.New("multiple CLDA in TXF file")
				}
				txfAsset.CLUTData = clda
			}
		default:
			{
				panic("Unknown TXF chunk tag: " + tag)
			}
		}
	}

	if int(txfAsset.Header.CLHEIterations) != len(txfAsset.CLUTHeader.Entries) {
		// panic("txf header clheIterations is not equal to actual entries in CLUT header")
	}

	return &txfAsset, nil
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
