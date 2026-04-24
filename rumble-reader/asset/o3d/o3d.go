package o3d

import (
	"errors"
	"fmt"
	"rumble-reader/chunk/shoc"
)

type O3D struct {
	rawData      []byte
	resourceName string
	shocHeader   shoc.SHDR

	Gmds []*Gmd
	Obfs []*Obf
}

func ParseO3D(buf []byte, header shoc.SHDR, resName string) (*O3D, error) {
	o3dAsset := O3D{
		rawData:      buf,
		resourceName: resName,
		shocHeader:   header,
		Gmds:         []*Gmd{},
		Obfs:         []*Obf{},
	}

	chunks, err := parseChunks(buf)

	if err != nil {
		return nil, err
		// panic(err)
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
				o3dAsset.Gmds = append(o3dAsset.Gmds, gmd)
				break
			}
		case "Obf ":
			{
				obf, err := parseObf(chunk.Payload)
				if err != nil {
					return nil, err
				}
				// panic if multiple obfs in the file, don't know if this can happen yet
				// if o3dAsset.Obf != nil {
				// 	return nil, errors.New("Need to handle multiple OBFs in o3d file...")
				// }
				o3dAsset.Obfs = append(o3dAsset.Obfs, obf)
				break
			}
		case "Part":
			{
				// Part chunks don't seem to have much of anything relevant
				// so skip past them for now.
				continue
			}
		default:
			{
				fmt.Println("UNRECOGNIZED CHUNK MAGIC: " + chunk.MagicString() + resName)
				return nil, errors.New("Unhandled o3d Chunk Magic: " + chunk.MagicString())
			}
		}
	}

	return &o3dAsset, nil
}
