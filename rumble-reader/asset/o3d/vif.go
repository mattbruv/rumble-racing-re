package o3d

import (
	"encoding/binary"
	"errors"
	"fmt"
	"math"
)

type UnpackData interface {
	isUnpack()
}

type UnpackV4_32 struct {
	Offset int
	Data   []V4_32
}

type V4_32 struct {
	V1 uint32
	V2 uint32
	V3 uint32
	V4 uint32
}

type UnpackV3_32 struct {
	Offset int
	Data   []V3_32
}

type V3_32 struct {
	V1 float32
	V2 float32
	V3 float32
}

type UnpackV2_32 struct {
	Offset int
	Data   []V2_32
}

type V2_32 struct {
	V1 float32
	V2 float32
}

func (UnpackV4_32) isUnpack() {}
func (UnpackV3_32) isUnpack() {}
func (UnpackV2_32) isUnpack() {}

func isUnpack(cmd byte) bool {
	// VIF UNPACK opcodes are 0x60–0x7F
	return cmd >= 0x60 && cmd <= 0x7F
}

func unpackData(data []byte, offset *int, cmd byte, num byte) (UnpackData, error) {

	// TODO: implement based on UNPACK format (VN/VL, count, addr, etc.)
	// For now just stub + advance safely to avoid infinite loop
	// fmt.Printf("UNPACK at offset 0x%X\n", *offset)

	unpackType := cmd & 0b1111

	// fmt.Println("command:", cmd, "unpack type:")
	// fmt.Printf("command: %X ", cmd)
	// fmt.Printf("unpack type: %X ", unpackType)
	// fmt.Printf("num: %X\n", num)

	switch unpackType {
	case 0xc:
		{
			// fmt.Println("DO 0xC!")
			// vecs := data[*offset+4 : *offset+4+(4*4)]
			var out UnpackV4_32
			out.Offset = *offset

			for range num {
				var entry V4_32
				base := *offset + 4

				entry.V1 = binary.LittleEndian.Uint32(data[base:])
				entry.V2 = binary.LittleEndian.Uint32(data[base+4:])
				entry.V3 = binary.LittleEndian.Uint32(data[base+8:])
				entry.V4 = binary.LittleEndian.Uint32(data[base+12:])

				out.Data = append(out.Data, entry)

				// fmt.Printf("v1: %d, v2: %d, v3: %d, v4: %d\n", v1, v2, v3, v4)
				*offset += (4 * 4)
			}

			return out, nil
		}

	case 0x8:
		{
			// fmt.Println("DO 0xC!")
			// vecs := data[*offset+4 : *offset+4+(4*4)]
			var out UnpackV3_32
			out.Offset = *offset

			for range num {
				var entry V3_32
				base := *offset + 4
				entry.V1 = math.Float32frombits(binary.LittleEndian.Uint32(data[base:]))
				entry.V2 = math.Float32frombits(binary.LittleEndian.Uint32(data[base+4:]))
				entry.V3 = math.Float32frombits(binary.LittleEndian.Uint32(data[base+8:]))
				out.Data = append(out.Data, entry)
				*offset += (4 * 3)
			}

			return out, nil
		}

	case 0x4: // is this UVs?
		{
			// fmt.Println("DO 0xC!")
			// vecs := data[*offset+4 : *offset+4+(4*4)]
			var out UnpackV2_32
			out.Offset = *offset

			for range num {
				var entry V2_32
				base := *offset + 4
				entry.V1 = math.Float32frombits(binary.LittleEndian.Uint32(data[base:]))
				entry.V2 = math.Float32frombits(binary.LittleEndian.Uint32(data[base+4:]))
				out.Data = append(out.Data, entry)
				*offset += (4 * 2)
			}

			return out, nil
		}
	}

	// Example: skip 16 bytes as placeholder
	// *offset += 16
	fmt.Println()

	return nil, errors.New("Unhandled VIF Unpack command")
}

func (elda *ELDA) ParseVif() []UnpackData {

	var out []UnpackData
	// fmt.Println("LEN:", len(elda.rawData))
	// data := elda.Data

	// offset := 0

	// for offset+4 <= len(data) {
	// 	word := binary.LittleEndian.Uint32(data[offset : offset+4])
	// 	cmd := byte(word >> 24)
	// 	num := byte(word >> 16)

	// 	if isUnpack(cmd) {
	// 		res, err := unpackData(data, &offset, cmd, num)

	// 		if err != nil {
	// 			fmt.Printf("Skipping unknown unpack command %X at offset 0x%X\n", cmd, offset)
	// 		}

	// 		out = append(out, res)

	// 		// switch unpacked := res.(type) {
	// 		// case UnpackV4_32:
	// 		// 	{
	// 		// 		fmt.Println(offset)
	// 		// 		for _, entry := range unpacked.data {
	// 		// 			fmt.Println(entry.v1, entry.v2, entry.v3, entry.v4)
	// 		// 		}
	// 		// 		break
	// 		// 	}
	// 		// case UnpackV3_32:
	// 		// 	{
	// 		// 		fmt.Println(offset)
	// 		// 		for _, entry := range unpacked.data {
	// 		// 			fmt.Println(entry.v1, entry.v2, entry.v3)
	// 		// 		}
	// 		// 		break
	// 		// 	}

	// 		// }
	// 		// fmt.Println(num)
	// 	}

	// 	offset += 4
	// }

	return out
}
