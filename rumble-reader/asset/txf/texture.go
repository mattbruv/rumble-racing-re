package txf

import (
	"encoding/binary"
	"fmt"
	"image"
	"image/color"
	"rumble-reader/helpers"
)

type TextureFile struct {
	Height uint16
	Width  uint16
	Image  *image.RGBA
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

			// Pull the CLUT **once** per texture
			paletteStart := clhe.CLDAStartOffset
			if int(paletteStart)+256*2 > len(txf.CLUTData.RawData) {
				fmt.Println("Invalid CLUT pointer!")
				continue
			}

			linearPalette := txf.CLUTData.RawData[paletteStart : paletteStart+(256*2)]

			grouped := helpers.GroupBytesIntoPairs(linearPalette)
			swizzled, err := helpers.SwizzleClutPstm8(grouped)
			if err != nil {
				panic(err)
			}
			// swizzledPalette := helpers.SwizzleClutPSMT8(linearPalette)

			for k, txImage := range tex.Images {

				height := txImage.BlockHeightPixels
				width := tex.BlockWidthPixels >> k

				format := clhe.PixelFormat

				if format != 2 { // IDTEX8 (indexed 256-color)
					fmt.Println("Skipping type:", format)
					continue
				}

				img := image.NewRGBA(image.Rect(0, 0, int(width), int(height)))

				// Extract texture data (one byte per pixel)
				start := txImage.TXDAAddressOffset
				size := uint32(height) * uint32(width)
				if int(start)+int(size) > len(txf.TextureData.RawData) {
					fmt.Println("Texture data OOB")
					continue
				}
				data := txf.TextureData.RawData[start : start+size]

				for pxIndex, colorIndex := range data {

					idx := int(colorIndex)

					// Compute swizzled CLUT lookup position
					// mort := interleaveBits(idx&0xF, (idx>>4)&0xF)
					// off := mort * 2

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
					Height: height,
					Width:  width,
					Image:  img,
				})
			}

			textures = append(textures, Texture{
				Name:  fmt.Sprintf("tx_%d_%d", i, j),
				Files: mipMaps,
			})
		}
	}

	return textures
}
