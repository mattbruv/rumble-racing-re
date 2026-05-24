package convert

import (
	"bytes"
	"fmt"
	"image/png"
	"rumble-reader/asset/txf"
)

func ConvertTXFAsset(t *txf.TXF, name string) []ConvertedAssetFile {

	var out []ConvertedAssetFile

	for _, texture := range t.GetTextures() {
		for _, f := range texture.Files {
			var buf bytes.Buffer
			if err := png.Encode(&buf, f.Image); err != nil {
				panic(err)
			}

			mipmap := ""
			if f.IsMipMap {
				mipmap = "-mipmap"
			}

			// name := fmt.Sprintf("%s-%s-%dx%d%s.png", t.resourceName, texture.Name, f.Width, f.Height, mipmap)
			name := fmt.Sprintf("%s%s.png", texture.Name, mipmap)
			out = append(out, ConvertedAssetFile{
				FullFileName: name,
				Data:         buf.Bytes(),
			})
		}
	}

	return out
}
