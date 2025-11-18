package txf

type HEAD struct {
}

func parseHEAD(buf []byte) (*HEAD, error) {
	return &HEAD{}, nil
}
