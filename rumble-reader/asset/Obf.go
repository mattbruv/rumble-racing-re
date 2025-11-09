package asset

type Obf struct {
	rawData []byte
}

func (o *Obf) GetType() string {
	return "Obf "
}

func (o *Obf) RawData() []byte {
	return o.rawData
}
