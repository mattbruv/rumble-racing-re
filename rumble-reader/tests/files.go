package tests

import (
	"rumble-reader/file"
	"rumble-reader/helpers"
)

type TestTrack struct {
	Data  helpers.TrackFileData
	Track file.TrackFile
}

func GetTestFiles() []TestTrack {

	tracks := make([]TestTrack, len(helpers.TrackData))

	for i := range helpers.TrackData {
		prefix := "LOC" + helpers.TrackData[i].InternalName[0:2] + "/"
		tracks[i].Track = file.ReadTrackFile("../../data/" + prefix + helpers.TrackData[i].InternalName + ".TRK")
		tracks[i].Data = helpers.TrackData[i]
	}

	return tracks
}
