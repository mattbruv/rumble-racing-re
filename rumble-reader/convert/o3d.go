package convert

import (
	"fmt"
	"rumble-reader/asset/o3d"
)

func ConvertO3DAsset(o *o3d.O3D, name string, resolveTexture TextureResolver) []ConvertedAssetFile {
	var out []ConvertedAssetFile

	for obf_idx, obf := range o.Obfs {
		buf := BuildGtlf(obf, resolveTexture)
		out = append(out, ConvertedAssetFile{
			FullFileName: fmt.Sprintf("%s_%d_.gltf", o.Name(), obf_idx),
			Data:         buf,
		})
	}

	return out
}
