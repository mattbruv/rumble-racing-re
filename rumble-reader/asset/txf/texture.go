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
					// palette is your []byte length 512
					// low := palette[off]    // low byte
					// high := palette[off+1] // high byte

					px := binary.LittleEndian.Uint16(palette[off : off+2])

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
