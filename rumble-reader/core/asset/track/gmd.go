package track

import (
	"fmt"
	"rumble-reader/asset"
)

type TrackData struct {
	rawData []byte

	SunI SunI
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
		switch chunk.MagicString() {
		case "SunI":
			trackData.SunI = ParseSunI(chunk.Payload)
		}
		fmt.Println(chunk.MagicString())
	}

	return &trackData, nil
}
