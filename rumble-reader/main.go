package main

import (
	"encoding/hex"
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
							next, ok := file.TopLevelChunks[i+1].(*shoc.Shoc)

							if ok {
								fmt.Println(hex.Dump(pt.Data()))

								nextDat, ok := next.MetaData.(*shoc.SDAT)
								if ok {
									var combined = dat.Data()
									combined = append(combined, nextDat.Data()...)

									parsed, err := asset.ParseRLst(combined)

									if err != nil {
										panic(err)
									}

									for _, e := range parsed.Entries {
										out := fmt.Sprintf("%d,%s,%s", e.ResourceIndex, e.ResourceName, e.TypeTag)
										fmt.Println(out)
									}

									fmt.Println(len(parsed.Entries))

								}
							}
							// fmt.Println(shc.StartAddress())
							// os.WriteFile("./RLst.dat", dat.Data(), 0644)
						}

					}
				}
			}

		}

	}
}
