package shoc

import "errors"

// Decompress implements a reconstruction of the LZ/RLE decompression routine
// inferred from the decompiled PowerPC code.
// It runs until the input bytes are exhausted, without needing an output size.
func Decompress(src []byte) ([]byte, error) {
	var dst []byte
	i := 0

	for i+1 < len(src) {
		// Read 2-byte control word
		b0 := src[i]
		b1 := src[i+1]
		i += 2
		control := uint16(b0)<<8 | uint16(b1)

		// --- Case 1: Special marker 0x8800 (RLE or literal block) ---
		if (control & 0x8800) == 0x8800 {
			mode := (b0 >> 4) & 7

			if mode == 0 {
				// Literal copy
				count := int(control&0x7FF) | int(b1)
				if i+count > len(src) {
					return nil, errors.New("literal copy out of range")
				}
				dst = append(dst, src[i:i+count]...)
				i += count
			} else {
				// Run-length repeat (repeat one previous byte)
				offset := int(mode)
				if offset <= 0 || offset > len(dst) {
					return nil, errors.New("invalid repeat offset")
				}
				value := dst[len(dst)-offset]
				repeatCount := int(b1) + 3

				for r := 0; r < repeatCount; r++ {
					dst = append(dst, value)
				}
			}

			continue
		}

		// --- Case 2: LZ backreference ---
		length := int((b0 >> 4) & 7)
		if length == 7 {
			// Extended length
			if i >= len(src) {
				return nil, errors.New("unexpected end of input in length extension")
			}
			length = int(src[i]) + 7
			i++
		}
		length += 3

		// Compute offset
		offset := int(control&0x0FFF) | int(b1)
		if offset <= 0 || offset > len(dst) {
			return nil, errors.New("invalid LZ backreference offset")
		}

		start := len(dst) - offset
		if start < 0 {
			return nil, errors.New("negative LZ offset")
		}

		reverse := (control & 0x8000) != 0

		if reverse {
			// Reverse copy
			for j := 0; j < length && start-j-1 >= 0; j++ {
				dst = append(dst, dst[start-j-1])
			}
		} else {
			// Forward copy
			for j := 0; j < length && start+j < len(dst); j++ {
				dst = append(dst, dst[start+j])
			}
		}
	}

	return dst, nil
}
