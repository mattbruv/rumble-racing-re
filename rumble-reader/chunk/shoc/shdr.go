package shoc

import (
	"encoding/json"
	"rumble-reader/helpers"
)

type SHDR struct {
	data      []byte
	AssetType string
}

func (s *SHDR) FourCC() string {
	return "SHDR"
}

func (s *SHDR) Data() []byte {
	return s.data
}

func parseSHDR(data []byte) *SHDR {

	fourCCbytes := append([]byte(nil), data[4:8]...)
	helpers.ReverseBytesInPlace(fourCCbytes)
	fourCC := string(fourCCbytes)

	return &SHDR{
		data:      data,
		AssetType: fourCC,
	}
}

func (c *SHDR) MarshalJSON() ([]byte, error) {
	arr := []interface{}{c.FourCC(), c.AssetType}
	return json.Marshal(arr)
}
