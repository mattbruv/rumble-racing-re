package main

import (
	"encoding/binary"
	"fmt"
	"io"
	"log"
	"os"
)

func main() {
	filename := "SE1.TRK"
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

	i := 0

	for {
		i += 1
		pos, _ := file.Seek(0, io.SeekCurrent)
		fourcc, size, _, err := readChunk(file)
		if err == io.EOF {
			break
		}
		if err == io.ErrUnexpectedEOF {
			fmt.Println("Unexpected EOF — incomplete chunk at end of file.")
			break
		}
		if err != nil {
			log.Fatalf("Error reading chunk at 0x%X: %v", pos, err)
		}

		fmt.Printf("Offset 0x%08X | FOURCC: %-4s | Size: 0x%08X bytes\n", pos, fourcc, size)

		// if i == 2 {
		// 	break
		// }
	}

}

func readChunk(r io.ReadSeeker) (fourcc string, chunkSize uint32, data []byte, err error) {
	var tag [4]byte
	if _, err = io.ReadFull(r, tag[:]); err != nil {
		return "", 0, nil, err
	}

	// Reverse FOURCC bytes since it's stored little-endian
	for i := 0; i < 2; i++ {
		tag[i], tag[3-i] = tag[3-i], tag[i]
	}

	fourcc = string(tag[:])

	// read chunk size in bytes (second u32)
	if err = binary.Read(r, binary.LittleEndian, &chunkSize); err != nil {
		return fourcc, 0, nil, err
	}

	dataSize := chunkSize - 8
	data = make([]byte, dataSize)

	if _, err = io.ReadFull(r, data); err != nil {
		return fourcc, 0, nil, err
	}

	// fmt.Println(hex.Dump(data))

	// fmt.Printf("Size (data): %d\n", len(data))
	// fmt.Printf("Size (decimal): %d\n", chunkSize)

	return fourcc, chunkSize, data, nil
}
