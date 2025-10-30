package tests

import (
	"testing"
)

func TestAssumeFillsEmpty(t *testing.T) {
	files := GetTestFiles()

	for _, file := range files {
		if file.Track.FileSize > 50000 {
			t.Error("Fuck", file.Track.FileSize)
		}
	}
}
