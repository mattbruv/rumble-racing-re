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
	ADCBitSet bool

	X float32
	Y float32
	Z float32
}

type UV struct {
	U float32
	V float32
}

type TriangleStrip struct {
	// The material to apply to this geometry
	// Texture  TextureEntry
	Vertices []Vertex
	Normals  []Normal
	UVs      []UV
}

type SubMesh struct {
}

type ELDA_Geometry struct {
	Strips []TriangleStrip
}

func (vif *ParsedELDAVif) GetELDAGeometry(textures TextureMeta) (*ELDA_Geometry, error) {
	stripMap := make(map[uint32]*TriangleStrip)

	// Filter: collect all UNPACK commands of interest
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
		cmdA, cmdB, cmdC := filtered[i], filtered[i+1], filtered[i+2]
		typeA, typeB, typeC := cmdA.Unpack.Type, cmdB.Unpack.Type, cmdC.Unpack.Type

		// 1. Identify the Target Mesh (Texture Group)
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

		// 2. Get/Create the flat Mesh for this texture
		texKey := assignedTexture.ELDAOffset
		if _, ok := stripMap[texKey]; !ok {
			stripMap[texKey] = &TriangleStrip{
				// Texture: *assignedTexture,
				// Ensure your Mesh struct has these flat slices now
				Vertices: []Vertex{},
				Normals:  []Normal{},
				UVs:      []UV{},
			}
		}
		m := stripMap[texKey]

		// 3. Append data directly to the Mesh's main arrays
		if typeA == UnpackTypeV3_32 && typeB == UnpackTypeV3_32 && typeC == UnpackTypeV2_32 {
			// Pattern: (normal, vertex, uv)
			for j := uint8(0); j < cmdA.Num; j++ {
				vNorm := cmdA.Unpack.V3_32[j]
				vVert := cmdB.Unpack.V3_32[j]
				vUV := cmdC.Unpack.V2_32[j]

				m.Normals = append(m.Normals, Normal{X: vNorm.V1, Y: vNorm.V2, Z: vNorm.V3, ADCBitSet: vNorm.ADCBitSet})
				m.Vertices = append(m.Vertices, Vertex{X: vVert.V1, Y: vVert.V2, Z: vVert.V3})
				m.UVs = append(m.UVs, UV{U: vUV.V1, V: vUV.V2})
			}
		} else {
			// Pattern: (vertex, uv, normal)
			for j := uint8(0); j < cmdA.Num; j++ {
				vVert := cmdA.Unpack.V3_32[j]
				vUV := cmdB.Unpack.V2_32[j]
				vNorm := cmdC.Unpack.V4_8[j]

				m.Vertices = append(m.Vertices, Vertex{X: vVert.V1, Y: vVert.V2, Z: vVert.V3})
				m.UVs = append(m.UVs, UV{U: vUV.V1, V: vUV.V2})
				m.Normals = append(m.Normals, Normal{
					X:         float32(vNorm.V1) / 255.0,
					Y:         float32(vNorm.V2) / 255.0,
					Z:         float32(vNorm.V3) / 255.0,
					ADCBitSet: vNorm.ADCBitSet,
				})
			}
		}
	}

	// 4. Final Assembly
	var finalStrips []TriangleStrip
	for _, tex := range textures.TextureEnties {
		if m, ok := stripMap[tex.ELDAOffset]; ok {
			finalStrips = append(finalStrips, *m)
		}
	}

	return &ELDA_Geometry{Strips: finalStrips}, nil
}
