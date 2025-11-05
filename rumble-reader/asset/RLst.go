package asset

import (
	"bytes"
	"encoding/binary"
	"fmt"
	"io"
)

type RLst struct {
	Entries []RLstEntry
}

type RLstEntry struct {
	ID      uint32
	TypeTag string
	Index   uint32
	Path    string
}

func ParseRLst(buf []byte) (*RLst, error) {
	var parsed RLst
	r := bytes.NewReader(buf)

	i := 0
	for {
		var id uint32
		if err := binary.Read(r, binary.LittleEndian, &id); err != nil {
			if err == io.EOF {
				break
			}
			return &parsed, nil
		}

		var tag [4]byte
		if _, err := io.ReadFull(r, tag[:]); err != nil {
			return &parsed, nil
		}

		var index uint32
		if err := binary.Read(r, binary.LittleEndian, &index); err != nil {
			return &parsed, nil
		}

		// Read null-terminated path string
		pathBytes := make([]byte, 0, 128)
		for {
			b, err := r.ReadByte()
			if err != nil {
				return nil, fmt.Errorf("read path: %w", err)
			}
			if b == 0 {
				break
			}
			pathBytes = append(pathBytes, b)
		}
		path := string(pathBytes)

		entry := RLstEntry{
			ID:      id,
			TypeTag: string(tag[:]),
			Index:   index,
			Path:    path,
		}
		parsed.Entries = append(parsed.Entries, entry)
		i++
	}

	return &parsed, nil
}
