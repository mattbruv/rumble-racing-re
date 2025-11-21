package tests

import (
	"fmt"
	"rumble-reader/helpers"
	"testing"
)

func TestSwizzleClutPSMT8(t *testing.T) {
	// 1. Create 512 bytes of sequential test data
	linearBytes := make([]byte, 512)
	for i := 0; i < 256; i++ {
		// Example data creation from the test: (0, 0), (1, 1), (2, 2), ... (255, 255)
		linearBytes[i*2] = byte(i)
		linearBytes[i*2+1] = byte(i)
	}

	// 2. Group the bytes into 256 TwoBytePair structs
	pairs := helpers.GroupBytesIntoPairs(linearBytes)

	// 3. Reorder the 256 pairs according to the CLUT index
	reorderedPairs, err := helpers.ReorderArray(pairs)
	if err != nil {
		fmt.Println("Error during reordering:", err)
		return
	}

	fmt.Println(reorderedPairs)

	panic("shit")
}
