package track

import (
	"encoding/hex"
	"fmt"
)

type SunI struct {
	rawData []byte
}

func ParseSunI(buf []byte) SunI {
	buf = buf[8:] // skip magic and size

	sun := SunI{
		rawData: buf,
	}

	fmt.Println(hex.Dump(buf))

	return sun
}
