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

	if !bytes.Equal(decompressed, target) {
		os.WriteFile("./fail.bin", decompressed, 0644)
		t.Errorf("Decompression failed")
	}
}
