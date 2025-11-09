package asset

type Gmd struct {
	rawData []byte
}

func (g *Gmd) GetType() string {
	return "Gmd "
}

func (g *Gmd) RawData() []byte {
	return g.rawData
}

func ParseGmd(data []byte) (*Gmd, error) {

	return nil, nil

}
