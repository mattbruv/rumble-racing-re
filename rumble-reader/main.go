package main

import (
	"encoding/hex"
	"fmt"
	"rumble-reader/asset"
	"rumble-reader/chunk/shoc"
	"rumble-reader/file"
)

func main() {

	f := file.ReadTrackFile("../data/SE1.TRK")

	fmt.Println(f.FileName, f.FileSize, len(f.TopLevelChunks))

	// get resource list?

	for i, main := range f.TopLevelChunks {

		shc, ok := main.(*shoc.Shoc)

		if ok {

			dat, ok := shc.MetaData.(*shoc.SDAT)

			if ok {

				prev, ok := f.TopLevelChunks[i-1].(*shoc.Shoc)

				if ok {

					pt, ok := prev.MetaData.(*shoc.SHDR)
					if ok {

						if pt.NextFourCC == "RLst" {
							next, ok := f.TopLevelChunks[i+1].(*shoc.Shoc)

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
										out := fmt.Sprintf("%s,%s,%d", e.ResourceName, e.TypeTag, e.ResourceIndex)
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
