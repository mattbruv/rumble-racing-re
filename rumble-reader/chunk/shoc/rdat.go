package shoc

import "encoding/json"

type Rdat struct {
	data []byte
}

func (s *Rdat) FourCC() string {
	return "Rdat"
}

func (s *Rdat) Data() []byte {
	return s.data
}

func parseRdat(data []byte) *Rdat {
	return &Rdat{
		data: data,
	}
}

func (c *Rdat) MarshalJSON() ([]byte, error) {
	arr := []interface{}{c.FourCC()}
	return json.Marshal(arr)
}
