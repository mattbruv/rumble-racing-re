package txf

import (
	"encoding/binary"
	"fmt"
	"image"
	"image/color"
	"rumble-reader/helpers"
)

type TextureFile struct {
	IsMipMap bool
	Height   uint16
	Width    uint16
	Image    *image.RGBA
}

type Texture struct {
	Name  string
	Files []TextureFile
}

func (txf *TXF) GetTextures() []Texture {

	var textures []Texture

	for i, tex := range txf.textureHeaders {

		clhe := txf.clutHeader.Entries[i]

		for j, tex := range tex.Textures {
			extracted := extractTexturesFromZTHE(txf, clhe, tex, i, j)
			textures = append(textures, extracted...)
		}
	}

	return textures
}

const (
	// Texel storage format
	PSMCT32 = 0 // [RGBA32], directly stored in 4 bytes
	PSMCT16 = 2 // [RGBA16, RGBA16] across 4 bytes

	// Indexed color (CLUT Types)
	PSMT8 = 19 // 8 bits per index = 0 -> 255 palette indices
	PSMT4 = 20 // 4 bits per index = 0 -> 16 palette indices
)

func extractTexturesFromZTHE(txf *TXF, clutHeader CLHEEntry, zthe ZTHETexture, ztheIndex int, textureIndex int) []Texture {
	var mipMaps []TextureFile
	var textures []Texture

	paletteStart := clutHeader.CLDAStartOffset

	// TODO:
	// change behavior based on CLUT and texel mode
	// calculate palette size
	// if PSTM8, the size is 512

	for k, txImage := range zthe.Images {

		var paletteSize uint32
		// clut size is based on whether it's
		switch zthe.TexelStorageFormat {
		case PSMT8:
			// 8 bits per index, or 2^8
			paletteSize = 256
		case PSMT4:
			// 4 bits per index, or 2^4
			paletteSize = 16
		default:
			panic("Unhandled indexed texel format!")
		}

		var pixelBytes int
		// next, multiply the paletteSize based on number of bytes each pixel/mode takes up
		// going to be 4 bytes per pixel for 32 bit color, or 2 bytes for 16 bit
		switch clutHeader.PixelFormat {
		case PSMCT32: // PSMCT32, 32 bits color per pixel
			pixelBytes = 4
			paletteSize *= 4
		case PSMCT16: // PSMCT16, 16 bits color per pixel
			continue
			pixelBytes = 2
			paletteSize *= 2
		default:
			panic("Unhandled clut size!")
		}
		// fmt.Println("Do", zthe.TexelStorageFormat, clutHeader.PixelFormat)
		// continue

		paletteDataUnswizzled := txf.clutData.RawData[paletteStart : paletteStart+paletteSize]

		// represents the final transformed array of CLUT data depending on storage mode
		var swizzled []helpers.PixelBytes
		var err error

		// swizzle clut based on index type
		// I think only 8 bit indexing needs to be swizzled.
		switch zthe.TexelStorageFormat {
		case PSMT8:
			grouped := helpers.GroupBytesIntoChunks(paletteDataUnswizzled, pixelBytes)
			fmt.Println(len(grouped))
			swizzled, err = helpers.SwizzleClutPstm8(grouped)
			if err != nil {
				panic(err)
			}
		case PSMT4:
			// I don't think this needs to be swizzled, so just group?
			grouped := helpers.GroupBytesIntoChunks(paletteDataUnswizzled, pixelBytes)
			swizzled = grouped
		default:
			fmt.Println(zthe.TexelStorageFormat)
			panic("Oh shit oh fuck unhandled!")
		}

		height := txImage.BlockHeightPixels
		width := zthe.BlockWidthPixels >> k

		img := image.NewRGBA(image.Rect(0, 0, int(width), int(height)))

		// Extract texture data (one byte per pixel)
		start := txImage.TXDAAddressOffset
		size := uint32(height) * uint32(width)
		if int(start)+int(size) > len(txf.textureData.RawData) {
			fmt.Println("Texture data OOB")
			continue
		}

		// if we are using 1 byte or half byte index, the color index needs to change

		switch zthe.TexelStorageFormat {
		case PSMT8: // in byte indexed color, the size is already fine
			break
		case PSMT4:
			size /= 2 // but if using half the bits, the size is half
		}

		data := txf.textureData.RawData[start : start+size]
		for pxIndex := range int(size) {

			// get the color index
			var colorIndex int
			switch zthe.TexelStorageFormat {
			case PSMT8:
				// just a normal byte
				colorIndex = int(data[pxIndex])
			case PSMT4:
				// half the pxIndex will get you the byte base
				base := pxIndex / 2
				twoColors := int(data[base])
				low := (twoColors & 0xF0) >> 4
				high := twoColors & 0xF
				// TODO: might need to swap logic here
				if (pxIndex % 2) != 0 {
					colorIndex = high
				} else {
					colorIndex = low
				}
			}

			idx := colorIndex

			// px := binary.LittleEndian.Uint16(swizzledPalette[idx : idx+2])
			fmt.Println(zthe.TexelStorageFormat, size)
			finalPixel := swizzled[idx]

			var R uint8
			var G uint8
			var B uint8
			var A uint8

			switch clutHeader.PixelFormat {
			case PSMCT16:
				R, G, B, A = extract16bitRGBA(finalPixel) // 255uint8(a1 * 255)
			case PSMCT32:
				R, G, B, A = extract32bitRGBA(finalPixel)
			default:
				panic("oh fuck!")
			}

			x := pxIndex % int(width)
			y := pxIndex / int(width)

			img.Set(x, y, color.RGBA{R, G, B, A})
		}

		mipMaps = append(mipMaps, TextureFile{
			Height:   height,
			Width:    width,
			Image:    img,
			IsMipMap: k > 0,
		})
	}

	textures = append(textures, Texture{
		Name:  fmt.Sprintf("%d_%d", ztheIndex, textureIndex),
		Files: mipMaps,
	})

	return textures
}

func extract32bitRGBA(finalPixel helpers.PixelBytes) (uint8, uint8, uint8, uint8) {
	// TODO: might need to swap this?
	word := binary.LittleEndian.Uint32(finalPixel.Bytes)

	A := (word & 0xFF000000) >> (8 * 3)
	B := (word & 0x00FF0000) >> (8 * 2)
	G := (word & 0x0000FF00) >> (8 * 1)
	R := (word & 0x000000FF)

	// fmt.Println(len(finalPixel.Bytes), hex.Dump(finalPixel.Bytes), word)
	// panic("unimplemented")

	return uint8(R), uint8(G), uint8(B), uint8(A)
}

func extract16bitRGBA(finalPixel helpers.PixelBytes) (uint8, uint8, uint8, uint8) {
	px := binary.LittleEndian.Uint16(finalPixel.Bytes)

	// Extract 5:5:5 bits
	r5 := px & 0x1F
	g5 := (px >> 5) & 0x1F
	b5 := (px >> 10) & 0x1F
	// a1 := (px >> 15) & 0x1

	R := uint8((r5 * 255) / 31)
	G := uint8((g5 * 255) / 31)
	B := uint8((b5 * 255) / 31)
	A := uint8(255)
	return R, G, B, A
}
