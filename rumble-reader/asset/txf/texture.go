package txf

import "fmt"

type TextureFile struct {
}

type Texture struct {
	Name  string
	Files []TextureFile
}

func (t *TXF) GetTextures() []Texture {

	var textures []Texture

	for h, tex := range t.TextureHeaders {
		for a, t := range tex.Textures {
			if len(t.Images) > 1 {
				fmt.Println("")
				fmt.Println("")
			}
			for b, img := range t.Images {
				fmt.Println(h, a, b, " -> ", img.BlockHeightPixels, "x", t.BlockWidthPixels>>b)
			}
		}
	}

	return textures
}
