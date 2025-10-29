package main

import (
	"os"
	"path/filepath"
)

func main() {

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

		for _, c := range track.Chunks {
			tags[c.FourCC] = tags[c.FourCC] + 1
			// c.print(false)
		}
	}

	for a, count := range tags {
		println(a, count)
	}
}
