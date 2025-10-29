package main

import (
	"os"
	"path/filepath"
)

func main() {
	file := "./TRK/SE1.TRK"
	track := ReadTrackFile(file)
	var shocs []Chunk

	for _, c := range track.Chunks {
		if c.FourCC == "SHOC" {
			shocs = append(shocs, c)
		}
	}

	i := 0
	for _, shoc := range shocs {
		shoc.print(true)
		subchunks := ParseSubChunks(&shoc)

		println(len(subchunks))
		break
		i++
	}
	println(i)

}

func stats() {

	dir := "./TRK"

	entries, err := os.ReadDir(dir)

	if err != nil {
		panic(err)
	}

	tags := map[string]uint32{}
	i := 0
	for _, entry := range entries {
		path := filepath.Join(dir, entry.Name())

		track := ReadTrackFile(path)
		if track.FileName == "FE2.TRK" {
			continue
		}

		i += 1

		// println(track.FileSize, track.FileName)

		for _, c := range track.Chunks {
			tags[c.FourCC] = tags[c.FourCC] + 1
			if c.FourCC == "FILL" {
				empty := true
				for _, b := range c.Data {
					if b != 0 {
						empty = false
					}
				}
				if !empty {
					println("FILL not empty at", track.FileName, c.ChunkStart)
				}
				// println("CTRL size:", len(c.Data)/4, c.Index, track.FileName)
			}
			// c.print(false)
		}
	}

	for a, count := range tags {
		println(a, count)
	}
}
