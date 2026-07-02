package convert

import (
	"fmt"
	"rumble-reader/asset/track"
)

func ConvertTrackData(t *track.TrackData, name string) []ConvertedAssetFile {
	var out []ConvertedAssetFile

	out = append(out, ConvertedAssetFile{
		FullFileName: fmt.Sprintf("%s.rawTrack", name),
		Data:         t.RawData(),
	})

	return out
}
