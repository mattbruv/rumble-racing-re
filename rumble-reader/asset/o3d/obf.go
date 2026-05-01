package o3d

import (
	"encoding/hex"
	"fmt"
)

type Obf struct {
	rawData []byte

	// Head *Head
	// ELHEs []ELHE
	// ELTLs []ELTL
	// ELDAs []ELDA
}

func parseObf(buf []byte) (*Obf, error) {
	obfAsset := Obf{
		rawData: buf,
	}

	// Skip past the .Obf header, like the game does
	obfBytes := buf[0x18:]

	// fmt.Println(hex.Dump(obfBytes))
	// fmt.Println("PARSE OBF CHUNKS")

	chunks, err := parseObfChunks(obfBytes)
	if err != nil {
		return nil, err
	}

	for i, chunk := range chunks {
		fmt.Println("CHUNK: ", i)
		fmt.Println(chunk)

		fmt.Println(hex.Dump(chunk.ELTL.Raw.Payload))
	}

	fmt.Println("CHUNKS: ", len(chunks))

	return &obfAsset, nil
}
