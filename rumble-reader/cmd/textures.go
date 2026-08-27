package cmd

import (
	"fmt"
	"path"
	"strings"

	"rumble-reader-cli/convert"
	"rumble-reader/asset"
	"rumble-reader/asset/txf"
	"rumble-reader/file"
)

type textureIndex struct {
	parsed    map[string]asset.Asset
	sources   map[int][]textureSource
	txfPrefix string
}

type textureSource struct {
	folder           string
	resourceNameBase string
}

func buildTextureIndex(trackFile file.TrackFile, rlst *asset.RLst, createSubFolders bool) *textureIndex {
	index := &textureIndex{
		parsed:    map[string]asset.Asset{},
		sources:   map[int][]textureSource{},
		txfPrefix: "",
	}

	if createSubFolders {
		index.txfPrefix = "../txf/"
	}

	for _, entry := range rlst.Entries {
		if !isTextureResource(entry) {
			continue
		}

		theAsset, err := trackFile.GetResource(entry)
		if err != nil {
			continue
		}

		txfAsset, ok := theAsset.(*txf.TXF)
		if !ok {
			continue
		}

		index.parsed[resourceKey(entry)] = theAsset

		source := textureSource{
			folder:           resourceSlug(entry),
			resourceNameBase: resourceBaseName(entry.ResourceName),
		}

		for _, id := range txfAsset.TextureIDs() {
			index.sources[int(id)] = append(index.sources[int(id)], source)
		}
	}

	return index
}

func (t *textureIndex) getResource(trackFile file.TrackFile, entry asset.ResourceEntry) (asset.Asset, error) {
	if theAsset, ok := t.parsed[resourceKey(entry)]; ok {
		return theAsset, nil
	}

	return trackFile.GetResource(entry)
}

func (t *textureIndex) resolverFor(entry asset.ResourceEntry) convert.TextureResolver {
	modelName := resourceBaseName(entry.ResourceName)

	return func(textureId int) string {
		sources := t.sources[textureId]

		if len(sources) == 0 {
			return convert.DefaultTextureURI(textureId)
		}

		match := sources[0]
		if len(sources) > 1 {
			for _, source := range sources {
				if source.resourceNameBase == modelName {
					match = source
					break
				}
			}
		}

		return fmt.Sprintf("%s%s/texture_%d.png", t.txfPrefix, match.folder, textureId)
	}
}

func isTextureResource(entry asset.ResourceEntry) bool {
	return entry.TypeTag == "txf " || entry.TypeTag == "txf2"
}

func resourceKey(entry asset.ResourceEntry) string {
	return fmt.Sprintf("%s_%d", entry.TypeTag, entry.ResourceIndex)
}

func resourceSlug(entry asset.ResourceEntry) string {
	return fmt.Sprintf("%d_%s", entry.ResourceIndex, sanitizeResourceName(entry.ResourceName))
}

func sanitizeResourceName(name string) string {
	name = strings.ReplaceAll(name, "/", "-")
	return strings.ReplaceAll(name, ":", "-")
}

func resourceBaseName(name string) string {
	if idx := strings.LastIndex(name, ":"); idx >= 0 {
		name = name[idx+1:]
	}

	return strings.ToUpper(strings.TrimSuffix(name, path.Ext(name)))
}
