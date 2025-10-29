package main

import (
	"fmt"
)

func main() {
	chunks := ReadTrackFile("TRK/FE2.TRK")

	for i, c := range chunks {
		fmt.Printf("Chunk %d ", i)
		c.print()
	}
}
