package convert

import (
	"fmt"
	"rumble-reader/asset/o3d"
)

func ConvertOBFAsset(o *o3d.Obf, name string) []ConvertedAssetFile {
	var out []ConvertedAssetFile

	bytes := BuildGtlf(o)

	out = append(out, ConvertedAssetFile{
		FullFileName: fmt.Sprintf("%s.gltf", name),
		Data:         bytes,
	})

	return out
}
