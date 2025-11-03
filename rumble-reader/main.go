package main

import (
	"encoding/json"
	"fmt"
	"os"
	"rumble-reader/chunk"
)

type SizeAndCount struct {
	Size  int
	Count uint32
}

func main() {
	file := "../data/FE2.TRK"
	track := chunk.ReadTrackFile(file)

	m, _ := json.Marshal(track)

	if err := os.WriteFile("../out.json", m, 0644); err != nil {
		fmt.Println("Error writing file:", err)
	}

}
