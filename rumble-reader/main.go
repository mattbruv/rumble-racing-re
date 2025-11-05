package main

import (
	"encoding/hex"
	"fmt"
	"rumble-reader/file"
)

func main() {

	f := file.ReadTrackFile("../data/FE2.TRK")

	fmt.Println(f.FileName, f.FileSize, len(f.TopLevelChunks))

	rlst, _ := f.GetResourceList()

	for i, entry := range rlst.Entries {
		fmt.Println(i, entry.ResourceName, entry.TypeTag)
	}

	first := rlst.Entries[189]

	fmt.Println(first.ResourceName)
	asset, err := f.GetResource(first)
	if err != nil {
		panic(err)
	}

	fmt.Println(asset.GetType())
	fmt.Println(hex.Dump(asset.RawData()))

}
