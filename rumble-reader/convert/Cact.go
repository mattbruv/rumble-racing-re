package convert

import (
	"encoding/json"
	"fmt"
	"rumble-reader/asset"
)

func ConvertCactAsset(actor *asset.Actor, name string) []ConvertedAssetFile {
	fileName := fmt.Sprintf("%s.json", name)
	b, _ := json.MarshalIndent(actor, "", "  ")
	outFile := ConvertedAssetFile{
		FullFileName: fileName,
		Data:         b,
	}

	return []ConvertedAssetFile{outFile}
}
