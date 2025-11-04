package shoc

import "fmt"

// Decompress implements a simplified reconstruction of the PowerPC LZ/RLE algorithm.
func Decompress(src []byte, outSize int) ([]byte, error) {
	dst := make([]byte, 0, outSize)
	i := 0 // input index

	for len(dst) < outSize {
		if i+1 >= len(src) {
			return nil, fmt.Errorf("unexpected end of input")
		}

		b0 := src[i]
		b1 := src[i+1]
		i += 2

		control := uint16(b0)<<8 | uint16(b1)

		if (control & 0x8800) == 0x8800 {
			// RLE or literal block
			mode := (b0 >> 4) & 7

			if mode == 0 {
				// Literal copy
				count := int(control&0x7FF) | int(b1)
				if i+count > len(src) {
					return nil, fmt.Errorf("literal copy out of range")
				}
				dst = append(dst, src[i:i+count]...)
				i += count
			} else {
				// Run-length fill (repeat a previous byte)
				offset := int(mode)
				if offset >= len(dst) {
					return nil, fmt.Errorf("invalid backreference")
				}
				value := dst[len(dst)-offset]
				repeatCount := int(b1) + 3

				for r := 0; r < repeatCount; r++ {
					dst = append(dst, value)
				}
			}
		} else {
			// LZ backreference
			length := int((b0 >> 4) & 7)
			if length == 7 {
				// extended length
				if i >= len(src) {
					return nil, fmt.Errorf("input underrun")
				}
				length = int(src[i]) + 7
				i++
			}
			length += 3

			offset := int(control&0x0FFF) | int(b1)
			if offset > len(dst) {
				return nil, fmt.Errorf("invalid offset")
			}

			start := len(dst) - offset
			if start < 0 {
				return nil, fmt.Errorf("negative offset")
			}

			// Optional: if high bit set, reverse copy
			reverse := (control & 0x8000) != 0

			if reverse {
				for j := 0; j < length; j++ {
					dst = append(dst, dst[start-j-1])
				}
			} else {
				for j := 0; j < length; j++ {
					dst = append(dst, dst[start+j])
				}
			}
		}
	}

	if len(dst) != outSize {
		dst = dst[:outSize] // trim or pad if necessary
	}

	return dst, nil
}
