package txf

import (
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

func (t *TXF) GetTextures() []Texture {

	var textures []Texture

	for _, tex := range t.TextureHeaders {
		for j, t := range tex.Textures {

			var mipMaps []TextureFile

			for k, img := range t.Images {
				// fmt.Println(i, j, k, " -> ", img.BlockHeightPixels, "x", t.BlockWidthPixels>>k)
				height := img.BlockHeightPixels
				width := t.BlockWidthPixels >> k

				img := image.NewRGBA(image.Rect(0, 0, int(width), int(height)))

				// Fill with a gradient or any dynamic content
				for y := 0; y < int(height); y++ {
					for x := 0; x < int(width); x++ {
						img.Set(x, y, color.RGBA{
							R: uint8(x % 256),
							G: uint8(y % 256),
							B: uint8((x + y) % 256),
							A: 255,
						})
					}
				}

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
