package o3d

import (
	"errors"
	"rumble-reader/chunk/shoc"
)

type O3D struct {
	rawData      []byte
	resourceName string
	shocHeader   shoc.SHDR

	Gmd *Gmd
	Obf *Obf
}

func ParseO3D(buf []byte, header shoc.SHDR, resName string) (*O3D, error) {
	o3dAsset := O3D{
		rawData:      buf,
		resourceName: resName,
		shocHeader:   header,
		Gmd:          nil,
		Obf:          nil,
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
					return nil, err
				}
				// panic if multiple obfs in the file, don't know if this can happen yet
				if o3dAsset.Obf != nil {
					return nil, errors.New("Need to handle multiple OBFs in o3d file...")
				}
				o3dAsset.Obf = obf
				break
			}
		default:
			{
				return nil, errors.New("Unhandled o3d Chunk Magic: " + chunk.MagicString())
				// panic("UNRECOGNIZED CHUNK MAGIC: " + chunk.MagicString())
			}
		}
	}

	return &o3dAsset, nil
}
