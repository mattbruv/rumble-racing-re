package asset

type Asset interface {
	GetType() string
	RawData() []byte
}

type GenericAsset struct {
	tag     string
	rawData []byte
}

func (g *GenericAsset) GetType() string {
	return g.tag
}

func (g *GenericAsset) RawData() []byte {
	return g.rawData
}

func ParseGenericAsset(buf []byte, tag string) (*GenericAsset, error) {
	resource := GenericAsset{
		rawData: buf,
		tag:     tag,
	}

	return &resource, nil
}
