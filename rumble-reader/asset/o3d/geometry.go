package o3d

import "fmt"

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

type Mesh struct {
	// The material to apply to this geometry
	Texture  TextureEntry
	Vertices []Vertex
	Normals  []Normal
	UVs      []UV
}

type SubMesh struct {
}

type Geometry struct {
	Mesh Mesh
}

func (vif *ParsedVif) GetGeometry(textures TextureMeta) (*Geometry, error) {
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

	single := &Mesh{
		Vertices: []Vertex{},
		Normals:  []Normal{},
		UVs:      []UV{},
	}

	for i := 0; i < len(filtered); i += 3 {
		cmdA, cmdB, cmdC := filtered[i], filtered[i+1], filtered[i+2]
		typeA, typeB, typeC := cmdA.Unpack.Type, cmdB.Unpack.Type, cmdC.Unpack.Type

		if typeA == UnpackTypeV3_32 && typeB == UnpackTypeV3_32 && typeC == UnpackTypeV2_32 {
			for j := uint8(0); j < cmdA.Num; j++ {
				vNorm := cmdA.Unpack.V3_32[j]
				vVert := cmdB.Unpack.V3_32[j]
				vUV := cmdC.Unpack.V2_32[j]
				single.Normals = append(single.Normals, Normal{X: vNorm.V1, Y: vNorm.V2, Z: vNorm.V3, ADCBitSet: vNorm.ADCBitSet})
				single.Vertices = append(single.Vertices, Vertex{X: vVert.V1, Y: vVert.V2, Z: vVert.V3})
				single.UVs = append(single.UVs, UV{U: vUV.V1, V: vUV.V2})
			}
		} else if typeA == UnpackTypeV3_32 && typeB == UnpackTypeV2_32 && typeC == UnpackTypeV4_8 {
			for j := uint8(0); j < cmdA.Num; j++ {
				vVert := cmdA.Unpack.V3_32[j]
				vUV := cmdB.Unpack.V2_32[j]
				vNorm := cmdC.Unpack.V4_8[j]
				single.Vertices = append(single.Vertices, Vertex{X: vVert.V1, Y: vVert.V2, Z: vVert.V3})
				single.UVs = append(single.UVs, UV{U: vUV.V1, V: vUV.V2})
				single.Normals = append(single.Normals, Normal{
					X:         float32(vNorm.V1) / 255.0,
					Y:         float32(vNorm.V2) / 255.0,
					Z:         float32(vNorm.V3) / 255.0,
					ADCBitSet: vNorm.ADCBitSet,
				})
			}
		} else {
			return nil, fmt.Errorf("found an invalid triplet at offset %d: (%s, %s, %s)", cmdA.Unpack.Offset, typeA, typeB, typeC)
		}
	}

	return &Geometry{Mesh: *single}, nil
}
