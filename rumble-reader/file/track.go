package file

import (
	"fmt"
	"io"
	"log"
	"os"
	"rumble-reader/asset"
	"rumble-reader/chunk"
	"rumble-reader/chunk/shoc"
)

type TrackFile struct {
	FileName       string
	FileSize       int64
	TopLevelChunks []chunk.TopLevelChunk
}

func readTrackFile(file io.ReadSeeker) []chunk.TopLevelChunk {

	var chunks []chunk.TopLevelChunk

	var chunkIndex uint32 = 0
	for {
		pos, _ := file.Seek(0, io.SeekCurrent)
		chunkObj, err := readTopLevelChunk(file, chunkIndex)
		if err == io.EOF {
			// fmt.Println("reached end of file!")
			break
		}
		if err == io.ErrUnexpectedEOF {
			fmt.Println("Unexpected EOF — incomplete chunk at end of file.")
			break
		}
		if err != nil {
			log.Fatalf("Error reading chunk at 0x%X: %v", pos, err)
		}

		// Do not append empty FILL chunks, who cares about them.
		_, ok := chunkObj.(*chunk.Fill)

		if !ok {
			chunks = append(chunks, chunkObj)
		}
		chunkIndex++
	}

	return chunks
}

func ReadTrackFile(filename string) TrackFile {
	file, err := os.Open(filename)

	if err != nil {
		log.Fatalf("Failed to open file: %v", err)
	}

	defer file.Close()

	info, err := file.Stat()

	if err != nil {
		log.Fatalf("Failed to get file info: %v", err)
	}

	// fmt.Printf("File: %s\nSize: %d bytes\n\n", info.Name(), info.Size())

	chunks := readTrackFile(file)

	return TrackFile{
		FileName:       info.Name(),
		FileSize:       info.Size(),
		TopLevelChunks: chunks,
	}
}

func readTopLevelChunk(r io.ReadSeeker, chunkIndex uint32) (chunk.TopLevelChunk, error) {
	startPosSigned, _ := r.Seek(0, io.SeekCurrent)
	startPos := uint32(startPosSigned)

	tag := make([]byte, 4)
	if _, err := io.ReadFull(r, tag); err != nil {
		return nil, err
	}

	// Reverse bytes if little-endian
	for i := 0; i < 2; i++ {
		tag[i], tag[3-i] = tag[3-i], tag[i]
	}
	fourcc := string(tag)

	pos, _ := r.Seek(0, io.SeekCurrent)

	switch fourcc {
	case "CTRL":
		return chunk.ReadCTRLChunk(r, startPos, chunkIndex)
	case "SHOC":
		return shoc.ReadSHOCChunk(r, startPos, chunkIndex)
	case "FILL":
		return chunk.ReadFILLChunk(r, startPos, pos, chunkIndex)
	default:
		return chunk.ReadGenericChunk(r, fourcc, startPos, chunkIndex)
	}
}

func (t TrackFile) GetResourceList() (*asset.RLst, bool) {

	headers := t.getHeadersForType("RLst")

	for _, header := range headers {
		// fmt.Println(header.Unk0, header.AssetType, header.AssetIndex, header.TotalDataSize)

		rList, err := asset.ParseRLst(t.getDataForHeader(header))
		if err != nil {
			panic(err)
		}
		return rList, true
		// fmt.Println(hex.Dump(hdr.Data()))
	}

	return nil, false
}

func (t TrackFile) getHeadersForType(assetType string) []shoc.SHDR {
	var headers []shoc.SHDR

	// Get the SHDRs for all assetTypes in the file
	for _, chunk := range t.TopLevelChunks {
		// get SHOC
		shc, ok := chunk.(*shoc.Shoc)
		if ok {
			// Get Headers
			header, ok := shc.MetaData.(*shoc.SHDR)
			if ok {
				if header.AssetType == assetType {
					headers = append(headers, *header)
				}
			}
		}
	}

	return headers
}

func (t TrackFile) getDataForHeader(header shoc.SHDR) []byte {
	var chunks []shoc.Shoc

	var assetData []byte

	fmt.Println(header.AssetIndex, header.AssetType, header.ShocIndex)

	// Find the first SHOC associated with this header, and then
	// collect all shocks until totalSize >= headerTotalSize
	hdrShoc := t.TopLevelChunks[header.ShocIndex]
	fmt.Println("Header shoc:", hdrShoc.StartAddress(), header.ShocIndex)

	shocCount := 1
	for {
		topLevel := t.TopLevelChunks[header.ShocIndex+uint32(shocCount)]

		theShoc, ok := topLevel.(*shoc.Shoc)

		if !ok {
			// skip past filler/unrelated chunks
			continue
		}

		fmt.Println(theShoc.StartAddress(), theShoc.MetaData.FourCC())

		switch data := theShoc.MetaData.(type) {
		case *shoc.SDAT:
			chunks = append(chunks, *theShoc)
			assetData = append(assetData, data.Data()...)
		default:
			panic("Unhandled SHOC type!" + data.FourCC())
		}

		shocCount++
		// fmt.Println("total size", len(assetData))

		if len(assetData) >= int(header.TotalDataSize) {
			break
		}
	}

	return assetData
}

func (t TrackFile) GetResource(resource asset.ResourceEntry) (asset.Asset, error) {

	fmt.Println("attempting to get", resource.ResourceName, resource.TypeTag, "at", resource.ResourceIndex)
	headers := t.getHeadersForType(resource.TypeTag)

	for _, header := range headers {
		// fmt.Println(header.Unk0, header.AssetType, header.AssetIndex, header.TotalDataSize)
		if header.AssetIndex == resource.ResourceIndex {
			addr := (t.TopLevelChunks[header.ShocIndex].StartAddress())
			fmt.Println("header found!", header.ShocIndex, addr)
			data := t.getDataForHeader(header)
			switch resource.TypeTag {
			case "TxtR":
				return asset.ParseTxtR(data)
			}
		}
	}

	return nil, fmt.Errorf("asset not found")
}
