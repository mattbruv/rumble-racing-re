package helpers

import "fmt"

// Pixel Storage Mode 8
// represents 0 -> 0xff texel indexing format
// this is how the 2 byte per RGBA color CLUT is re-arraigned.

// TwoBytePair represents a 16-bit data unit read from the linear array.
type TwoBytePair struct {
	Low  byte // Corresponds to the first byte in the pair
	High byte // Corresponds to the second byte in the pair
}

// Coord represents the (X, Y) location in the 16x16 CLUT grid.
type Coord struct {
	X uint8
	Y uint8
}

// mapLinearIndexToCoord implements the custom indexing (swizzling) algorithm
// to map a linear 8-bit index (0-255) to its (X, Y) coordinate in the 16x16 grid.
func mapLinearIndexToCoord(linearIndex uint8) Coord {
	// Logic derived from the IDTEX8 CLUT pattern:

	// yMajor: The most significant bit of the index, determining the top/bottom half (Y[3] is derived from I[6], not I[7] directly)
	yMajor := linearIndex >> 6 // Bits I[7:6] -> H, which affects Y

	iBlock := linearIndex & 0x3F // I[5:0]

	xMajor := iBlock >> 4 // Bits I[5:4]

	xBase := (xMajor & 1) << 3 // X base offset (0 or 8) is determined by I[4] here, which is part of the pattern

	xOffset := iBlock & 0x07 // Bits I[2:0]

	x := xBase + xOffset // Final X coordinate

	yMinorBase := (xMajor >> 1) << 1

	yMinorOffset := (iBlock >> 3) & 1 // Bit I[3]

	y := (yMajor << 2) + yMinorBase + yMinorOffset // Final Y coordinate

	return Coord{X: x, Y: y}
}

// GroupBytesIntoPairs converts a flat byte slice (expected length 512 for 256 pairs)
// into a slice of 256 TwoBytePair structs.
func GroupBytesIntoPairs(data []byte) []TwoBytePair {
	if len(data) != 512 {
		fmt.Printf("Warning: Input byte slice length is %d, expected 512 for 256 pairs.\n", len(data))
	}

	var pairs []TwoBytePair
	for i := 0; i < len(data); i += 2 {
		end := i + 2
		if end > len(data) {
			end = len(data)
		}

		twoBytes := data[i:end]

		// Ensure we always have two bytes for a pair
		if len(twoBytes) == 2 {
			pairs = append(pairs, TwoBytePair{
				Low:  twoBytes[0],
				High: twoBytes[1],
			})
		}
	}
	return pairs
}

// SwizzleClutPstm8 takes a flat array of 256 elements (data) and reorders them
// into a new 1D slice (length 256) according to the CLUT indexing scheme for Pstm8.
func SwizzleClutPstm8[T any](data []T) ([]T, error) {
	if len(data) != 256 {
		var zeroSlice []T
		return zeroSlice, fmt.Errorf("input array must contain exactly 256 elements, but got %d", len(data))
	}

	result := make([]T, 256)

	for i := 0; i < 256; i++ {
		linearIndex := uint8(i)

		coord := mapLinearIndexToCoord(linearIndex)

		// Calculate the flat index in the output array (Y*16 + X)
		flatIndex := int(coord.Y)*16 + int(coord.X)

		// Map the original linear data[i] to its new flat grid position.
		result[flatIndex] = data[i]
	}

	return result, nil
}
