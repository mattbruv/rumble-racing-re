package txf

type HEAD struct {
}

// TXF seems to contain
type TXF struct {
	rawData []byte

	header HEAD
}

func ParseTXF(buf []byte) (*TXF, error) {
	resource := TXF{
		rawData: buf,
	}

	return &resource, nil
}
