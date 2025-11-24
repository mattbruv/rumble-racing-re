package tests

import (
	"testing"
)

// Every FILL chunk is zeroed out
func TestAllFillsEmpty(t *testing.T) {
	files := GetTestFiles()
	for _, file := range files {
		for i := range file.Track.TopLevelChunks {
			chunk := file.Track.TopLevelChunks[i]
			if chunk.FourCC() == "FILL" {
				for _, b := range chunk.Data() {
					if b != 0 {
						t.Fatal("Non zero byte in FILL:", chunk.StartAddress(), file.Data.InternalName, file.Data.TrackName)
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
		if file.Track.TopLevelChunks[0].FourCC() != "CTRL" {
			t.Fatal("First chunk is not a CTRL!", file.Data.InternalName, file.Data.TrackName)
		}
	}
}

// Every chunk after FILL starts on a 0x6000 boundary
func TestChunkAfterFillAlwaysAligns6K(t *testing.T) {
	files := GetTestFiles()
	for _, file := range files {

		for i, chunk := range file.Track.TopLevelChunks {
			if chunk.FourCC() == "FILL" {
				if i+1 < len(file.Track.TopLevelChunks) {
					next := file.Track.TopLevelChunks[i+1]
					if (next.StartAddress() % 0x6000) != 0 {
						t.Fatal("No 0x6000 alignment after fill", next.FourCC(), next.StartAddress(), file.Data.InternalName, file.Data.TrackName)
					}
				}
			}

		}
	}
}
