package main

import (
	"fmt"
	"log"
	"os"
)

func main() {
	filename := "TRK/FE2.TRK"
	file, err := os.Open(filename)

	if err != nil {
		log.Fatalf("Failed to open file: %v", err)
	}

	defer file.Close()

	info, err := file.Stat()

	if err != nil {
		log.Fatalf("Failed to get file info: %v", err)
	}

	fmt.Printf("File: %s\nSize: %d bytes\n\n", info.Name(), info.Size())

	chunks := readTrackFile(file)

	for i, c := range chunks {
		fmt.Printf("Chunk %d ", i)
		c.print()
	}

}
