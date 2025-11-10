package asset

import (
	"encoding/binary"
	"os"
	"rumble-reader/helpers"
)

type Object3D struct {
	Gmd Gmd
	Obf Obf
}

type Gmd struct {
	TotalSize uint32
	Data      []byte
}

type Obf struct {
	Data      []byte
	TotalSize uint32
	Unknown1  uint32

	Sections []ObfSection
}

type ObfSection interface {
	FourCC() string
}

type HEAD struct {
	Unk1 uint32
	Unk2 uint32
}

type ELDA struct {
	Data []byte
}

type ELHE struct {
}
type ELTL struct {
	Data []byte
}

func (h *HEAD) FourCC() string {
	return "HEAD"
}

func (h *ELDA) FourCC() string {
	return "ELDA"
}

func (h *ELHE) FourCC() string {
	return "ELHE"
}

func (h *ELTL) FourCC() string {
	return "ELTL"
}

func parseObject3D(data []byte) Object3D {

	fourCC := (helpers.GetNextFourCC(data))

	if fourCC != "Gmd " {
		panic("Object3d does not start with Gmd header")
	}

	size := binary.LittleEndian.Uint32(data[4:8])
	gmdData := data[0:size]

	// Skip to next chunk
	data = data[size:]

	return Object3D{
		Gmd: Gmd{
			TotalSize: size,
			Data:      gmdData,
		},
		Obf: parseObf(data),
	}
}

func parseObf(data []byte) Obf {

	fourCC := (helpers.GetNextFourCC(data))

	if fourCC != "Obf " {
		panic("Data does not start with Obf header")
	}

	size := binary.LittleEndian.Uint32(data[4:8])
	allData := data

	data = data[16+4:]

	unk1 := binary.LittleEndian.Uint32(data[0:4])

	data = data[4:]

	sections := parseObfSections(data)

	obf := Obf{
		Data:      allData,
		TotalSize: size,
		Unknown1:  unk1,
		Sections:  sections,
	}

	return obf
}

func parseObfSection(data []byte) (ObfSection, []byte) {

	if len(data) == 0 {
		return nil, make([]byte, 0)
	}

	fourcc := string(data[:4])
	size := binary.LittleEndian.Uint32(data[4:8])
	remaining := data[8+size:]
	sectionData := data[8 : 8+size]
	// fmt.Println(fourcc, size)

	switch fourcc {
	case "HEAD":
		{
			return &HEAD{
				Unk1: 0,
				Unk2: 0,
			}, remaining
		}
	case "ELHE":
		{
			return &ELHE{}, remaining
		}
	case "ELTL":
		{
			return &ELTL{
				Data: sectionData,
			}, remaining
		}
	case "ELDA":
		{
			return &ELDA{
				Data: sectionData,
			}, remaining
		}
	default:
		panic("Unknown Obf section: " + fourcc)
	}
}

func parseObfSections(data []byte) []ObfSection {

	var sections []ObfSection

	for {
		section, remaining := parseObfSection(data)
		if section == nil {
			break
		}
		sections = append(sections, section)
		data = remaining
	}

	return sections
}

func Test03D() Object3D {
	file := "../test.o3d"
	data, err := os.ReadFile(file)
	if err != nil {
		panic(err)
	}

	return parseObject3D(data)
}
