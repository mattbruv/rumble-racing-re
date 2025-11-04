package shoc

import (
	"fmt"
	"unicode"
)

// Decompress implements a simplified reconstruction of the PowerPC LZ/RLE algorithm.
func Decompress(src []byte, outSize int) ([]byte, error) {
	dst := make([]byte, 0, outSize)
	i := 0 // input index

	fmt.Printf("Starting decompression: src length=%d, outSize=%d\n", len(src), outSize)

	printChar := func(b byte) string {
		r := rune(b)
		if unicode.IsPrint(r) {
			return string(r)
		}
		return "."
	}

	for len(dst) < outSize {
		if i+1 >= len(src) {
			return nil, fmt.Errorf("unexpected end of input at position %d", i)
		}

		b0 := src[i]
		b1 := src[i+1]
		i += 2

		control := uint16(b0)<<8 | uint16(b1)
		fmt.Printf("[SRC idx=%d] b0=0x%02X('%s') b1=0x%02X('%s') Control: 0x%04X, DST idx=%d\n",
			i-2, b0, printChar(b0), b1, printChar(b1), control, len(dst))

		if (control & 0x8800) == 0x8800 {
			// RLE or literal block
			mode := (b0 >> 4) & 7
			fmt.Printf("[SRC idx=%d] RLE/Literal block detected, mode=%d, DST idx=%d\n", i-2, mode, len(dst))

			if mode == 0 {
				// Literal copy
				count := int(control&0x7FF) | int(b1)
				fmt.Printf("[SRC idx=%d] Literal copy, count=%d, DST idx=%d\n", i, count, len(dst))
				if i+count > len(src) {
					return nil, fmt.Errorf("literal copy out of range at index %d", i)
				}

				for j := 0; j < count; j++ {
					val := src[i+j]
					dst = append(dst, val)
					fmt.Printf("  [SRC idx=%d] -> [DST idx=%d] 0x%02X('%s')\n",
						i+j, len(dst)-1, val, printChar(val))
				}
				i += count
			} else {
				// Run-length fill (repeat a previous byte)
				offset := int(mode)
				repeatCount := int(b1) + 3
				if offset >= len(dst) {
					return nil, fmt.Errorf("invalid backreference at dst length %d", len(dst))
				}
				value := dst[len(dst)-offset]
				fmt.Printf("[SRC idx=%d] RLE repeat, offset=%d, repeatCount=%d, value=0x%02X('%s'), DST idx=%d\n",
					i, offset, repeatCount, value, printChar(value), len(dst))
				for r := 0; r < repeatCount; r++ {
					dst = append(dst, value)
					fmt.Printf("  [DST idx=%d] 0x%02X('%s')\n", len(dst)-1, value, printChar(value))
				}
			}
		} else {
			// LZ backreference
			length := int((b0 >> 4) & 7)
			if length == 7 {
				if i >= len(src) {
					return nil, fmt.Errorf("input underrun at index %d", i)
				}
				length = int(src[i]) + 7
				i++
			}
			length += 3

			offset := int(control&0x0FFF) | int(b1)
			start := len(dst) - offset
			reverse := (control & 0x8000) != 0

			if offset > len(dst) || start < 0 {
				return nil, fmt.Errorf("invalid offset/start at DST idx=%d", len(dst))
			}

			fmt.Printf("[SRC idx=%d] LZ backreference, offset=%d, length=%d, reverse=%v, DST idx=%d, start=%d\n",
				i, offset, length, reverse, len(dst), start)

			if reverse {
				for j := 0; j < length; j++ {
					lookup := start + length - 1 - j
					val := dst[lookup]
					dst = append(dst, val)
					fmt.Printf("  [DST idx=%d], rev-offset=%d, len=%d, 0x%02X('%s') (reverse)\n", len(dst)-1, lookup, length, val, printChar(val))
				}
			} else {
				for j := 0; j < length; j++ {
					val := dst[start+j]
					dst = append(dst, val)
					fmt.Printf("  [DST idx=%d] 0x%02X('%s')\n", len(dst)-1, val, printChar(val))
				}
			}
		}
	}

	if len(dst) != outSize {
		fmt.Printf("Adjusting output size from %d to %d\n", len(dst), outSize)
		dst = dst[:outSize]
	}

	fmt.Println("Decompression finished successfully")
	return dst, nil
}
