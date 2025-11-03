package shoc

func Decompress(src []byte, dst []byte) (int, int) {
	srcLen := len(src)
	dstLen := len(dst)

	// Indices for current read/write positions
	srcIdx := 0
	dstIdx := 0

	for dstIdx < dstLen {
		// --- Safety Check for Token Header ---
		if srcIdx+2 > srcLen {
			break // Ran out of source data for header
		}

		// Read the two-byte token header
		bVar8 := src[srcIdx]
		bVar9 := src[srcIdx+1]
		srcIdx += 2

		token := uint16(bVar8)<<8 | uint16(bVar9)

		// ------------------------------------------------------------------
		// --- 1. Type 1: RLE/Literal Block (0x8800 Present)
		// ------------------------------------------------------------------
		if (token & 0x8800) == 0x8800 {
			offset3Bits := (bVar8 >> 4) & 0x07

			if offset3Bits == 0 {
				// Sub-Case A: Literal Copy (Plain Data Copy)
				length := int(token & 0x07FF)

				// Adjust length if it exceeds the remaining source or destination
				if srcIdx+length > srcLen {
					length = srcLen - srcIdx
				}
				if dstIdx+length > dstLen {
					length = dstLen - dstIdx
				}

				// Copy 'length' bytes directly using Go's built-in `copy`
				// This is much faster than the byte-by-byte loop from the pseudocode.
				bytesCopied := copy(dst[dstIdx:], src[srcIdx:srcIdx+length])

				srcIdx += bytesCopied
				dstIdx += bytesCopied
			} else {
				// Sub-Case B: Short RLE (Single-Byte Repeat)
				offset6Bits := int(offset3Bits) | int((token>>5)&0x38)
				length := int(bVar9) + 3

				// Calculate the source index in the destination buffer (history)
				srcPtrIdx := dstIdx - offset6Bits

				if srcPtrIdx < 0 {
					return srcIdx, dstIdx // Error: Invalid history reference
				}

				// Adjust length if it exceeds the remaining destination space
				if dstIdx+length > dstLen {
					length = dstLen - dstIdx
				}

				repeatedByte := dst[srcPtrIdx]

				// Write the byte 'length' times
				for i := 0; i < length; i++ {
					dst[dstIdx] = repeatedByte
					dstIdx++
				}
			}

		} else {
			// ------------------------------------------------------------------
			// --- 2. Type 2: LZ77-Style Backward Reference
			// ------------------------------------------------------------------
			length7Bits := int((bVar8 >> 4) & 0x07)

			// Check for extended length
			if length7Bits == 0x07 {
				if srcIdx >= srcLen {
					break
				}
				length7Bits = int(src[srcIdx]) + 7
				srcIdx++
			}
			length := length7Bits + 3

			// 12-bit distance/offset
			distance := int(token & 0x0FFF)

			srcPtrIdx := dstIdx - distance

			if srcPtrIdx < 0 {
				return srcIdx, dstIdx // Error: Invalid history reference
			}

			// Adjust length if it exceeds the remaining destination space
			if dstIdx+length > dstLen {
				length = dstLen - dstIdx
			}

			// Check MSB for copy direction: (token & 0x8000) == 0
			if (token & 0x8000) == 0 {
				// Sub-Case A: Forward Copy (Standard LZ77)

				// Must copy byte-by-byte to handle overlapping copies (e.g., repeating AB)
				for i := 0; i < length; i++ {
					// The source byte is taken from the current history (dst buffer)
					dst[dstIdx] = dst[srcPtrIdx]
					dstIdx++
					srcPtrIdx++
				}
			} else {
				// Sub-Case B: Backward/Reverse Copy
				srcPtrIdx += 2 // Offset the source pointer by +2

				// Copy in reverse order
				for i := 0; i < length; i++ {
					// Source index decreases as output index increases
					dst[dstIdx] = dst[srcPtrIdx]
					dstIdx++
					srcPtrIdx--
				}
			}
		}
	}

	return srcIdx, dstIdx
}
