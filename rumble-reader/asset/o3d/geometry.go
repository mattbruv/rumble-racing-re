package o3d

import (
	"fmt"
)

type Vertex struct {
	X float32
	Y float32
	Z float32
}

type Normal struct {
	X float32
	Y float32
	Z float32
}

type UV struct {
	U float32
	V float32
}

type Strip struct {
	Offset   int
	Texture  TextureEntry
	Vertices []Vertex
	Normals  []Normal
	UVs      []UV
}

type Geometry struct {
	Strips []Strip
}

func (vif *ParsedVif) GetGeometry(textures TextureMeta) (*Geometry, error) {
	var strips []Strip

	// Filter UNPACK commands
	var filtered []VifCommand
	for _, cmd := range vif.Commands {
		if cmd.Kind == VifCommandUNPACK {
			switch cmd.Unpack.Type {
			case UnpackTypeV3_32, UnpackTypeV2_32, UnpackTypeV4_8:
				filtered = append(filtered, cmd)
			}
		}
	}

	if len(filtered)%3 != 0 {
		return nil, fmt.Errorf("filtered unpack commands count %d not divisible by 3", len(filtered))
	}

	for i := 0; i < len(filtered); i += 3 {
		cmdA := filtered[i]
		cmdB := filtered[i+1]
		cmdC := filtered[i+2]

		if cmdA.Num != cmdB.Num || cmdB.Num != cmdC.Num {
			panic("num mismatch in triple")
		}

		groupOffset := cmdA.Unpack.Offset

		var assignedTexture *TextureEntry
		for j := range textures.TextureEnties {
			texOff := uint64(textures.TextureEnties[j].ELDAOffset)
			if texOff <= groupOffset {
				if assignedTexture == nil || uint64(assignedTexture.ELDAOffset) < texOff {
					assignedTexture = &textures.TextureEnties[j]
				}
			}
		}
		if assignedTexture == nil {
			return nil, fmt.Errorf("no texture for offset %d", groupOffset)
		}

		strip := Strip{
			Offset:  int(cmdA.Unpack.Offset),
			Texture: *assignedTexture,
		}

		// decode strip
		if cmdA.Unpack.Type == UnpackTypeV3_32 &&
			cmdB.Unpack.Type == UnpackTypeV3_32 &&
			cmdC.Unpack.Type == UnpackTypeV2_32 {

			for _, v := range cmdA.Unpack.V3_32 {
				strip.Normals = append(strip.Normals, Normal{v.V1, v.V2, v.V3})
			}
			for _, v := range cmdB.Unpack.V3_32 {
				strip.Vertices = append(strip.Vertices, Vertex{v.V1, v.V2, v.V3})
			}
			for _, v := range cmdC.Unpack.V2_32 {
				strip.UVs = append(strip.UVs, UV{v.V1, v.V2})
			}

		} else {
			for _, v := range cmdA.Unpack.V3_32 {
				strip.Vertices = append(strip.Vertices, Vertex{v.V1, v.V2, v.V3})
			}
			for _, v := range cmdB.Unpack.V2_32 {
				strip.UVs = append(strip.UVs, UV{v.V1, v.V2})
			}
			for _, v := range cmdC.Unpack.V4_8 {
				strip.Normals = append(strip.Normals, Normal{
					X: float32(v.V1) / 255.0,
					Y: float32(v.V2) / 255.0,
					Z: float32(v.V3) / 255.0,
				})
			}
		}

		strips = append(strips, strip)
	}

	return &Geometry{Strips: strips}, nil
}
