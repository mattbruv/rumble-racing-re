package main

import (
	"encoding/hex"
	"fmt"
	"os"
)

func main() {
	// file := "../data/FE2.TRK"
	// track := chunk.ReadTrackFile(file)

	// fmt.Println(track.FileName)
	// for _, top := range track.TopLevelChunks {

	// 	c, ok := top.(*shoc.Shoc)
	// 	if ok {

	// 		s, ok := c.MetaData.(*shoc.Rdat)
	// 		if ok {
	// 			size := binary.LittleEndian.Uint32(s.Data()[0:4])
	// 			fmt.Println(c.StartAddress(), s.FourCC(), size)

	// 		}

	// 	}

	// }

	file := "../eeMemory.bin"
	data, err := os.ReadFile(file)
	// data = data[4:]
	if err != nil {
		panic(err)
	}

	slice := data[0x00f90980 : 0x00f90980+9436]
	os.WriteFile("rdat-target.bin", slice, 0644)
	fmt.Println(hex.Dump(slice))

	// res, foo := shoc.Decompress(data, 0x24dc)
	// fmt.Println(res, foo)
	// fmt.Println(hex.Dump(res))
	// os.WriteFile("decompressed.bin", res, 0644)

}
