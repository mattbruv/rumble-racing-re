package main

import (
	"rumble-reader/chunk"
)

func main() {
	file := "../data/SE1.TRK"
	track := chunk.ReadTrackFile(file)
	var shocs []chunk.Chunk

	for _, c := range track.Chunks {
		if c.FourCC() == "SHOC" {
			shocs = append(shocs, c)
		}
	}

	// i := 0
	// for _, shoc := range shocs {
	// 	shoc.Print(true)
	// 	subchunks := chunk.ParseSubChunks(&shoc)

	// 	println(len(subchunks))
	// 	break
	// 	i++
	// }
	// println(i)

}
