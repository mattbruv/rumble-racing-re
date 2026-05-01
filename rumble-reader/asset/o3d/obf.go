package o3d

type Obf struct {
	rawData []byte

	RawObfChunks []ObfChunk
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

	obfAsset.RawObfChunks = chunks

	// // for _, chunk := range chunks {
	// // 	// fmt.Println("CHUNK: ", i)
	// // 	fmt.Println(chunk.ELHE.childCount, chunk.ELHE.maybeNumTextures, chunk.ELHE.unk2)
	// // 	fmt.Println(chunk.ELHE.X, chunk.ELHE.Y, chunk.ELHE.Z, chunk.ELHE.W)
	// // 	fmt.Println()
	// // }

	// fmt.Println("CHUNKS: ", len(chunks))

	return &obfAsset, nil
}
