package main

import (
	"fmt"
	"io"
	"log"
	"os"
)

func readTrackFile(file io.ReadSeeker) []Chunk {

	var chunks []Chunk

	i := 0
	for {
		i += 1
		pos, _ := file.Seek(0, io.SeekCurrent)
		chunk, err := readChunk(file)
		if err == io.EOF {
			fmt.Println("reached end of file!")
			break
		}
		if err == io.ErrUnexpectedEOF {
			fmt.Println("Unexpected EOF — incomplete chunk at end of file.")
			break
		}
		if err != nil {
			log.Fatalf("Error reading chunk at 0x%X: %v", pos, err)
		}

		chunks = append(chunks, chunk)
		// fmt.Printf("Offset 0x%08X | FOURCC: %-4s | Size: 0x%08X bytes\n", pos, chunk.FourCC, chunk.ChunkSize)
		// fmt.Println(hex.Dump(data))

		// if i == 2 {
		// 	break
		// }
	}

	return chunks
}

func ReadTrackFile(filename string) []Chunk {
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
	return chunks
}
