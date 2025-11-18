package txf

import (
	"encoding/binary"
	"encoding/hex"
	"fmt"
)

type ZTHE struct {
	TextureCount uint32
	Textures     []ZTHETexture
}

type ZTHETexture struct {
	// Each texture could have up to 4 mip-mapped sub-textures
}

func parseZTHE(buf []byte) (*ZTHE, error) {

	// size := binary.LittleEndian.Uint32(buf[4:8])
	// fmt.Println(size)

	texCount := binary.LittleEndian.Uint32(buf[8 : 8+4])
	buf = buf[8+4:]

	var textures []ZTHETexture

	for i := 0; i+0x48 <= len(buf); i += 0x48 {
		data := buf[i : i+0x48]
		fmt.Println(hex.Dump(data[0:8]))
		textures = append(textures, ZTHETexture{})
	}

	return &ZTHE{
		TextureCount: texCount,
		Textures:     textures,
	}, nil
}
