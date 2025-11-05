package main

import (
	"fmt"
	"os"
	"rumble-reader/file"
)

func main() {

	f := file.ReadTrackFile("../data/FE2.TRK")

	fmt.Println(f.FileName, f.FileSize, len(f.TopLevelChunks))

	rlst, _ := f.GetResourceList()

	for _, entry := range rlst.Entries {

		// tag := entry.TypeTag

		// extract IPums
		// if tag == "CarI" || tag == "Cimg" {

		asset, err := f.GetResource(entry)

		if err != nil {
			panic(err)
		}

		if len(asset.RawData()) > 0 {
			os.WriteFile("../ipums/"+entry.TypeTag+"_"+entry.ResourceName, asset.RawData(), 0644)
			fmt.Println(entry.ResourceName)
			// fmt.Println(hex.Dump(asset.RawData()))
		}
		// }

	}

}
