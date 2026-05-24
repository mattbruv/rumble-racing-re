package convert

import "rumble-reader/asset"

func ConvertGenericAsset(t *asset.GenericAsset, name string) []ConvertedAssetFile {
	// generic asset represents something we don't know how to convert,
	// so just return nothing.
	return make([]ConvertedAssetFile, 0)
}
