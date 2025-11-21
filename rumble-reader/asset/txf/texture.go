package txf

import (
	"encoding/binary"
	"fmt"
	"image"
	"image/color"
)

type TextureFile struct {
	Height uint16
	Width  uint16

	Image *image.RGBA
}

type Texture struct {
	Name  string
	Files []TextureFile
}

func (txf *TXF) GetTextures() []Texture {

	var textures []Texture

	for i, tex := range txf.TextureHeaders {

		clhe := txf.CLUTHeader.Entries[i]

		for j, tex := range tex.Textures {

			var mipMaps []TextureFile

			for k, txImage := range tex.Images {
				// fmt.Println(i, j, k, " -> ", img.BlockHeightPixels, "x", t.BlockWidthPixels>>k)
				height := txImage.BlockHeightPixels
				width := tex.BlockWidthPixels >> k

				format := clhe.PixelFormat

				// TODO: support other pixel types
				if format != 2 {
					fmt.Println("Skipping type:", format)
					continue
				}

				img := image.NewRGBA(image.Rect(0, 0, int(width), int(height)))

				// get data
				start := txImage.TXDAAddressOffset
				size := uint32(height) * uint32(width)
				data := txf.TextureData.RawData[start : start+size]

				for px_index, color_index := range data {

					// probe CLUT table for actual RGB value
					color_start := clhe.CLDAStartOffset
					// fmt.Println(len(txf.CLUTData.RawData))

					idx := int(color_index) // value is the pixel index 0..255
					off := idx * 2          // two bytes per palette entry

					palette := txf.CLUTData.RawData[color_start : color_start+(256*2)]

					out := SwizzleClutPSMT8(palette)
					// fmt.Println(hex.Dump(out))
					// break
					// palette is your []byte length 512
					// low := palette[off]    // low byte
					// high := palette[off+1] // high byte

					px := binary.LittleEndian.Uint16(out[off : off+2])

					r5 := px & 0x1F
					g5 := (px >> 5) & 0x1F
					b5 := (px >> 10) & 0x1F

					R := uint8((r5 * 255) / 31)
					G := uint8((g5 * 255) / 31)
					B := uint8((b5 * 255) / 31)

					x := px_index % int(width)
					y := px_index / int(width)
					// fmt.Println(px_index, x, y, value)
					img.Set(x, y, color.RGBA{
						R: R,
						G: G,
						B: B,
						A: 255,
					})
				}

				// get the raw data for this texture

				// Fill with a gradient or any dynamic content
				// for y := 0; y < int(height); y++ {
				// 	for x := 0; x < int(width); x++ {
				// 		img.Set(x, y, color.RGBA{
				// 			R: uint8(x % 256),
				// 			G: uint8(y % 256),
				// 			B: uint8((x + y) % 256),
				// 			A: 255,
				// 		})
				// 	}
				// }

				mipMaps = append(mipMaps, TextureFile{
					Height: height,
					Width:  width,
					Image:  img,
				})

			}

			textures = append(textures, Texture{
				Name:  "tx_" + fmt.Sprint(j),
				Files: mipMaps,
			})
		}

	}

	return textures
}

// func swizzleClutPSMT8(linear []uint16) []uint16 {
// 	if len(linear) != 256 {
// 		panic("CLUT must be exactly 256 entries")
// 	}

// 	out := make([]uint16, 256)

// 	// PS2 16×16 block-swizzled grid for CLUT
// 	for i := 0; i < 256; i++ {
// 		// Split into a 16×16 grid
// 		x := i & 0xF        // low 4 bits = X [0..15]
// 		y := (i >> 4) & 0xF // next 4 bits = Y [0..15]

// 		// Swizzle: X and Y interleaved (Morton interleave)
// 		// i.e., Z-order curve inside 16x16 block
// 		morton := interleaveBits(x, y)

// 		out[morton] = linear[i]
// 	}

// 	return out
// }

// // Interleave lower 4 bits of x & y into a Morton code (0-255)
// func interleaveBits(x, y int) int {
// 	var z int
// 	for i := 0; i < 4; i++ {
// 		z |= (x & (1 << i)) << i
// 		z |= (y & (1 << i)) << (i + 1)
// 	}
// 	return z
// }

func SwizzleClutPSMT8(linear []byte) []byte {
	if len(linear) != 512 { // 256 entries * 2 bytes each
		panic("CLUT must be exactly 256 entries (512 bytes)")
	}

	out := make([]byte, 512)

	for i := 0; i < 256; i++ {
		x := i & 0xF        // low 4 bits = X [0..15]
		y := (i >> 4) & 0xF // next 4 bits = Y [0..15]

		morton := interleaveBits(x, y)

		dst := morton * 2
		src := i * 2

		out[dst] = linear[src]
		out[dst+1] = linear[src+1]
	}

	return out
}

// Interleave lower 4 bits of X and Y → Morton index (0..255)
func interleaveBits(x, y int) int {
	var z int
	for i := 0; i < 4; i++ {
		z |= (x & (1 << i)) << i
		z |= (y & (1 << i)) << (i + 1)
	}
	return z
}
