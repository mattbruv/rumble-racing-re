package main

import (
	"fmt"
	"rumble-reader/chunk"
)

func main() {
	file := "../data/SE1.TRK"
	track := chunk.ReadTrackFile(file)
	// var shocs []chunk.Shoc

	for _, c := range track.TopLevelChunks {
		shoc, ok := c.(*chunk.Shoc)
		if ok {
			// shocs = append(shocs, *shoc)
			fmt.Println(shoc.Index(), shoc.FourCC())
		} else {
			fmt.Println(c.Index(), c.FourCC())
		}
	}

	// for _, shoc := range shocs {
	// 	println(shoc.FourCC(), shoc.Index())
	// }

}
