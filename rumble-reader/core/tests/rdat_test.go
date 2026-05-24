package tests

import (
	"bytes"
	"os"
	"rumble-reader/chunk/shoc"
	"testing"
)

func TestRdatDecompression(t *testing.T) {

	compressed, err := os.ReadFile("./data/rdat-compressed.bin")
	if err != nil {
		t.Fatal("Error reading input file")
	}

	target, err := os.ReadFile("./data/rdat-target.bin")

	if err != nil {
		t.Fatal("Error reading input file")
	}

	decompressed, err := shoc.Decompress(compressed, len(target))

	if err != nil {
		t.Fatal("Error with SHOC Rdat decompression")
	}

	similar := 0

	if !bytes.Equal(decompressed, target) {
		os.WriteFile("./fail.bin", decompressed, 0644)
		j := 0
		for i, b := range decompressed {
			if b != target[i] {
				j++
				if j < 20 {
					t.Logf("expected: %X but got %X at %d", target[i], b, i)
				}
			} else {
				similar++
			}
		}
		t.Log("Matching bytes %:", float32(similar)/float32(len(target))*100)
		t.Errorf("Decompression failed")
	}
}
