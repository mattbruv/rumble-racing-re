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

	for _, entry := range rlst.Entries {

		if entry.TypeTag == "CarI" {

			if entry.ResourceIndex == 0 {
				continue
			}

			asset, err := f.GetResource(entry)

			if err != nil {
				panic(err)
			}

			fmt.Println(asset.GetType())
			fmt.Println(hex.Dump(asset.RawData()))
		}

	}

}
