package track

import (
	"fmt"
	"rumble-reader/asset"
)

type TrackData struct {
	rawData []byte
}

func (t *TrackData) GetType() string {
	return "gmd"
}

func (t *TrackData) RawData() []byte {
	return t.rawData
}

func ParseTrackData(buf []byte) (*TrackData, error) {
	trackData := TrackData{
		rawData: buf,
	}

	fmt.Println("PARSE ME")
	chunks, err := asset.ParseChunks(buf)

	if err != nil {
		return nil, err
	}

	for _, chunk := range chunks {
		fmt.Println("MAGIC:", chunk.MagicString())
	}

	return &trackData, nil
}
