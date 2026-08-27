package convert

import (
	"fmt"
	"path"
	"rumble-reader/asset/o3d"
	"strings"
)

func ConvertO3DAsset(o *o3d.O3D, name string, resolveTexture TextureResolver) []ConvertedAssetFile {
	var out []ConvertedAssetFile

	baseName := strings.TrimSuffix(name, path.Ext(name))

	for obf_idx, obf := range o.Obfs {
		buf := BuildGtlf(obf, resolveTexture)
		out = append(out, ConvertedAssetFile{
			FullFileName: fmt.Sprintf("%s_%d_.gltf", baseName, obf_idx),
			Data:         buf,
		})
	}

	return out
}
