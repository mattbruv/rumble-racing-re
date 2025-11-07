package tests

import (
	"rumble-reader/file"
)

type TestTrack struct {
	InternalName string
	TrackName    string
	Track        file.TrackFile
}

var testTracks = []TestTrack{
	{InternalName: "BB1", TrackName: "Sun Burn"},
	{InternalName: "BB2", TrackName: "Surf And Turf"},
	{InternalName: "BL1", TrackName: "So Refined"},
	{InternalName: "BL2", TrackName: "Coal Cuts"},
	{InternalName: "DA1", TrackName: "Flip Out"},
	{InternalName: "DA2", TrackName: "The Gauntlet"},
	{InternalName: "DA3", TrackName: "Wild Kingdom"},
	// {InternalName: "FE2", TrackName: "Global Data"},
	{InternalName: "JT1", TrackName: "Circus Minimus"},
	{InternalName: "JT2", TrackName: "Outer Limits"},
	{InternalName: "MA1", TrackName: "Passing Through"},
	{InternalName: "MA2", TrackName: "Falls Down"},
	{InternalName: "MP1", TrackName: "Touch And Go"},
	{InternalName: "MP2", TrackName: "Car Go"},
	{InternalName: "SE1", TrackName: "True Grits"},
	{InternalName: "SE2", TrackName: "Over Easy"},
}

func GetTestFiles() []TestTrack {

	for i := range testTracks {
		prefix := "LOC" + testTracks[i].InternalName[0:2] + "/"
		testTracks[i].Track = file.ReadTrackFile("../../data/" + prefix + testTracks[i].InternalName + ".TRK")
	}

	return testTracks
}
