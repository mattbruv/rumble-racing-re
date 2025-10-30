package tests

import (
	"testing"
)

// Every FILL chunk is zeroed out
func TestAllFillsEmpty(t *testing.T) {
	files := GetTestFiles()
	for _, file := range files {
		for i := range file.Track.Chunks {
			chunk := file.Track.Chunks[i]
			if chunk.FourCC == "FILL" {
				for _, b := range chunk.Data {
					if b != 0 {
						t.Fatal("Non zero byte in FILL:", chunk.ChunkStart, file.InternalName, file.TrackName)
					}
				}
			}
		}
	}
}

// Every track file starts with a CTRL
func TestCtrlStart(t *testing.T) {
	files := GetTestFiles()
	for _, file := range files {
		if file.Track.Chunks[0].FourCC != "CTRL" {
			t.Fatal("First chunk is not a CTRL!", file.InternalName, file.TrackName)
		}
	}
}

// Every chunk after FILL starts on a 0x6000 boundary
func TestChunkAfterFillAlwaysAligns6K(t *testing.T) {
	files := GetTestFiles()
	for _, file := range files {

		for i, chunk := range file.Track.Chunks {
			if chunk.FourCC == "FILL" {
				if i+1 < len(file.Track.Chunks) {
					next := file.Track.Chunks[i+1]
					if (next.ChunkStart % 0x6000) != 0 {
						t.Fatal("No 0x6000 alignment after fill", next.FourCC, next.ChunkStart, file.InternalName, file.TrackName)
					}
				}
			}

		}
	}
}
