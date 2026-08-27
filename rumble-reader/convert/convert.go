package convert

import (
	"fmt"
	"rumble-reader/asset"
	"rumble-reader/asset/o3d"
	"rumble-reader/asset/txf"
)

// This is a simple struct which represents the asset after being converted to a usable file.
// For example, internal TXF binary will be converted to a list of simple PNG texture files.
type ConvertedAssetFile struct {
	FullFileName string
	Data         []byte
}

// TextureResolver maps a texture id referenced by a model to the URI of the
// converted image, relative to the folder the model is written to.
type TextureResolver func(textureId int) string

func DefaultTextureURI(textureId int) string {
	return fmt.Sprintf("../txf/texture_%d.png", textureId)
}

func ConvertAsset(theAsset asset.Asset, outFileName string, resolveTexture TextureResolver) []ConvertedAssetFile {
	if resolveTexture == nil {
		resolveTexture = DefaultTextureURI
	}

	switch x := theAsset.(type) {
	case *asset.Actor:
		{
			return ConvertCactAsset(x, outFileName)
		}
	case *asset.TxtR:
		{
			return ConvertTxtRAsset(x, outFileName)
		}
	case *o3d.O3D:
		{
			return ConvertO3DAsset(x, outFileName, resolveTexture)
		}
	case *asset.GenericAsset:
		{
			return ConvertGenericAsset(x, outFileName)
		}
	case *o3d.Obf:
		{
			return ConvertOBFAsset(x, outFileName, resolveTexture)
		}
	case *txf.TXF:
		{
			return ConvertTXFAsset(x, outFileName)
		}
	}

	panic(fmt.Sprintf("Unhandled asset conversion type: %v", theAsset.GetType()))
}
