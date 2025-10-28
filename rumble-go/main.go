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
		fourcc, data, err := readChunk(file)
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

		fmt.Printf("Offset 0x%08X | FOURCC: %-4s | Size: %d bytes\n", pos, fourcc, len(data))

		if i == 2 {
			break
		}
	}

}

func readChunk(r io.Reader) (fourcc string, data []byte, err error) {
	var tag [4]byte
	if _, err = io.ReadFull(r, tag[:]); err != nil {
		return "", nil, err
	}

	// Reverse FOURCC bytes since it's stored little-endian
	for i := 0; i < 2; i++ {
		tag[i], tag[3-i] = tag[3-i], tag[i]
	}

	fourcc = string(tag[:])

	// read chunk length in bytes, u32
	var size uint32
	if err = binary.Read(r, binary.LittleEndian, &size); err != nil {
		return "", nil, err
	}

	return fourcc, data, nil
}
