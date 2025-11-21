package asset

import "rumble-reader/chunk/shoc"

// This is a simple struct which represents the asset after being converted to a usable file.
// For example, internal TXF binary will be converted to a list of simple PNG texture files.
type ConvertedAssetFile struct {
	Name string
	Data []byte
}

type Asset interface {
	GetType() string
	RawData() []byte
	Header() shoc.SHDR
	GetConvertedFiles() []ConvertedAssetFile
}

type GenericAsset struct {
	header  shoc.SHDR
	tag     string
	rawData []byte
}

func (g *GenericAsset) GetType() string {
	return g.tag
}

func (g *GenericAsset) RawData() []byte {
	return g.rawData
}

func (g *GenericAsset) Header() shoc.SHDR {
	return g.header
}

func (t *GenericAsset) GetConvertedFiles() []ConvertedAssetFile {
	// generic asset represents something we don't know how to convert,
	// so just return nothing.
	return make([]ConvertedAssetFile, 0)
}

func ParseGenericAsset(buf []byte, tag string, header shoc.SHDR) (*GenericAsset, error) {
	resource := GenericAsset{
		header:  header,
		rawData: buf,
		tag:     tag,
	}

	return &resource, nil
}
