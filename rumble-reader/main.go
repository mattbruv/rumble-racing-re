package main

import (
	"fmt"
	"rumble-reader/asset"
	"rumble-reader/chunk"
	"rumble-reader/chunk/shoc"
)

func main() {

	file := chunk.ReadTrackFile("../data/SE1.TRK")

	fmt.Println(file.FileName, file.FileSize, len(file.TopLevelChunks))

	// get resource list?

	for i, main := range file.TopLevelChunks {

		shc, ok := main.(*shoc.Shoc)

		if ok {

			dat, ok := shc.MetaData.(*shoc.SDAT)

			if ok {

				prev, ok := file.TopLevelChunks[i-1].(*shoc.Shoc)

				if ok {

					pt, ok := prev.MetaData.(*shoc.SHDR)
					if ok {

						if pt.NextFourCC == "RLst" {
							parsed, err := asset.ParseRLst(dat.Data())

							if err != nil {
								panic(err)
							}

							for _, e := range parsed.Entries {
								fmt.Println(e.Path, e.TypeTag)

							}
							fmt.Println(len(parsed.Entries))
							fmt.Println(shc.StartAddress())
							// os.WriteFile("./RLst.dat", dat.Data(), 0644)
						}

					}
				}
			}

		}

	}
}
