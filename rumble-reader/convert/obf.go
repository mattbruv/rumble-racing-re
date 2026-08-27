package convert

import (
	"fmt"
	"rumble-reader/asset/o3d"
)

func ConvertOBFAsset(o *o3d.Obf, name string, resolveTexture TextureResolver) []ConvertedAssetFile {
	var out []ConvertedAssetFile

	bytes := BuildGtlf(o, resolveTexture)

	out = append(out, ConvertedAssetFile{
		FullFileName: fmt.Sprintf("%s.gltf", name),
		Data:         bytes,
	})

	return out
}
