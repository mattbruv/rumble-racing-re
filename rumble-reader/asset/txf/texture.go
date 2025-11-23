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
	PSM8 = 19 // 8 bits per index = 0 -> 255 palette indices
	PSM4 = 20 // 4 bits per index = 0 -> 16 palette indices
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
		case 19:
			paletteSize = 0xff // 0 -> 255 indexed
		case 20:
			paletteSize = 3
		default:
			panic("Unhandled indexed texel format!")
		}

		// next, multiply the paletteSize based on number of bytes each pixel/mode takes up
		// going to be 4 bytes per pixel for 32 bit color, or 2 bytes for 16 bit
		switch clutHeader.PixelFormat {
		case 0: // PSMCT32, 32 bits color per pixel
			paletteSize *= 4
		case 2: // PSMCT16, 16 bits color per pixel
			paletteSize *= 2
		default:
			panic("Unhandled clut size!")
		}
		// fmt.Println("Do", zthe.TexelStorageFormat, clutHeader.PixelFormat)
		// continue

		linearPalette := txf.clutData.RawData[paletteStart : paletteStart+paletteSize]

		grouped := helpers.GroupBytesIntoPairs(linearPalette)
		swizzled, err := helpers.SwizzleClutPstm8(grouped)
		if err != nil {
			panic(err)
		}
		// swizzledPalette := helpers.SwizzleClutPSMT8(linearPalette)

		height := txImage.BlockHeightPixels
		width := zthe.BlockWidthPixels >> k

		format := clutHeader.PixelFormat

		if format != 2 { // IDTEX8 (indexed 256-color)
			fmt.Println("Skipping type:", format)
			fmt.Println(zthe.TexelStorageFormat, clutHeader.CLDAStartOffset, txf.resourceName)
			fmt.Println("")
			continue
		} else {
			fmt.Println("FUCKING DO", zthe.TexelStorageFormat, clutHeader.PixelFormat)
		}

		img := image.NewRGBA(image.Rect(0, 0, int(width), int(height)))

		// Extract texture data (one byte per pixel)
		start := txImage.TXDAAddressOffset
		size := uint32(height) * uint32(width)
		if int(start)+int(size) > len(txf.textureData.RawData) {
			fmt.Println("Texture data OOB")
			continue
		}
		data := txf.textureData.RawData[start : start+size]

		for pxIndex, colorIndex := range data {

			idx := int(colorIndex)

			// px := binary.LittleEndian.Uint16(swizzledPalette[idx : idx+2])
			swiz := swizzled[idx]
			fuck := make([]byte, 2)
			fuck[0] = swiz.Low
			fuck[1] = swiz.High
			px := binary.LittleEndian.Uint16(fuck)

			// Extract 5:5:5 bits
			r5 := px & 0x1F
			g5 := (px >> 5) & 0x1F
			b5 := (px >> 10) & 0x1F
			// a1 := (px >> 15) & 0x1

			R := uint8((r5 * 255) / 31)
			G := uint8((g5 * 255) / 31)
			B := uint8((b5 * 255) / 31)
			A := uint8(255) // 255uint8(a1 * 255)

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
