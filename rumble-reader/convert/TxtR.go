package convert

import (
	"encoding/json"
	"fmt"
	"rumble-reader/asset"
)

func ConvertTxtRAsset(t *asset.TxtR, name string) []ConvertedAssetFile {
	fileName := fmt.Sprintf("TextResource-%d.json", t.Header().AssetIndex)
	b, _ := json.MarshalIndent(t.TextEntries, "", "  ")
	outFile := ConvertedAssetFile{
		FullFileName: fileName,
		Data:         b,
	}

	return []ConvertedAssetFile{outFile}
}
