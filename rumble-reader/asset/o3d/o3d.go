package o3d

type O3D struct {
	rawData      []byte
	resourceName string

	Gmd *Gmd
	Obf *Obf
}

func ParseO3D(buf []byte, resName string) (*O3D, error) {
	o3dAsset := O3D{
		// rawData:      buf,
		// resourceName: resName,
	}

	chunks, err := parseChunks(buf)

	if err != nil {
		panic(err)
	}

	for _, chunk := range chunks {
		// fmt.Println(chunk.MagicString())

		switch chunk.MagicString() {
		case "Gmd ":
			{
				gmd, err := parseGmd(chunk.Payload)
				if err != nil {
					panic(err)
				}
				o3dAsset.Gmd = gmd
				break
			}
		case "Obf ":
			{
				obf, err := parseObf(chunk.Payload)
				if err != nil {
					panic(err)
				}
				// panic if multiple obfs in the file, don't know if this can happen yet
				if o3dAsset.Obf != nil {
					panic("Need to handle multiple OBFs in o3d file...")
				}
				o3dAsset.Obf = obf
				break
			}
		default:
			{
				panic("UNRECOGNIZED CHUNK MAGIC: " + chunk.MagicString())
			}
		}
	}

	return &o3dAsset, nil
}
