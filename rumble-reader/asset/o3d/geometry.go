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

type Mesh struct {
	// The material to apply to this geometry
	Texture   TextureEntry
	SubMeshes []SubMesh
}

type SubMesh struct {
	Vertices []Vertex
	Normals  []Normal
	UVs      []UV
}

type Geometry struct {
	Meshes []Mesh
}

func (vif *ParsedVif) GetGeometry(textures TextureMeta) (*Geometry, error) {
	meshMap := make(map[uint32]*Mesh)

	// Filter: collect all UNPACK commands of type V3_32, V2_32, or V4_8
	var filtered []VifCommand
	for _, cmd := range vif.Commands {
		if cmd.Kind == VifCommandUNPACK {
			switch cmd.Unpack.Type {
			case UnpackTypeV3_32, UnpackTypeV2_32, UnpackTypeV4_8:
				filtered = append(filtered, cmd)
			}
		}
	}

	// Process in groups of three
	if len(filtered)%3 != 0 {
		return nil, fmt.Errorf("filtered unpack commands count %d not divisible by 3", len(filtered))
	}

	for i := 0; i < len(filtered); i += 3 {
		cmdA := filtered[i]
		cmdB := filtered[i+1]
		cmdC := filtered[i+2]

		typeA := cmdA.Unpack.Type
		typeB := cmdB.Unpack.Type
		typeC := cmdC.Unpack.Type

		// Assert that num matches across all three commands
		if cmdA.Num != cmdB.Num || cmdB.Num != cmdC.Num {
			panic(fmt.Sprintf("num mismatch in triple: %d, %d, %d", cmdA.Num, cmdB.Num, cmdC.Num))
		}

		// Validate pattern and determine data layout
		if typeA != UnpackTypeV3_32 || (typeB != UnpackTypeV3_32 && typeB != UnpackTypeV2_32) || (typeC != UnpackTypeV2_32 && typeC != UnpackTypeV4_8) {
			panic(fmt.Sprintf("unknown pattern: %s, %s, %s", typeA, typeB, typeC))
		}

		if !((typeA == UnpackTypeV3_32 && typeB == UnpackTypeV3_32 && typeC == UnpackTypeV2_32) ||
			(typeA == UnpackTypeV3_32 && typeB == UnpackTypeV2_32 && typeC == UnpackTypeV4_8)) {
			panic(fmt.Sprintf("unknown pattern: %s, %s, %s", typeA, typeB, typeC))
		}

		// Identify Mesh (by Texture)
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

		// Get/Create Mesh
		texKey := assignedTexture.ELDAOffset
		if _, ok := meshMap[texKey]; !ok {
			meshMap[texKey] = &Mesh{Texture: *assignedTexture}
		}
		parentMesh := meshMap[texKey]

		// Extract data into a SubMesh
		sub := SubMesh{}

		if typeA == UnpackTypeV3_32 && typeB == UnpackTypeV3_32 && typeC == UnpackTypeV2_32 {
			// Pattern: (normal, vertex, uv)
			for _, v := range cmdA.Unpack.V3_32 {
				sub.Normals = append(sub.Normals, Normal{X: v.V1, Y: v.V2, Z: v.V3})
			}
			for _, v := range cmdB.Unpack.V3_32 {
				sub.Vertices = append(sub.Vertices, Vertex{X: v.V1, Y: v.V2, Z: v.V3})
			}
			for _, v := range cmdC.Unpack.V2_32 {
				sub.UVs = append(sub.UVs, UV{U: v.V1, V: v.V2})
			}
		} else {
			// Pattern: (vertex, uv, normal)
			for _, v := range cmdA.Unpack.V3_32 {
				sub.Vertices = append(sub.Vertices, Vertex{X: v.V1, Y: v.V2, Z: v.V3})
			}
			for _, v := range cmdB.Unpack.V2_32 {
				sub.UVs = append(sub.UVs, UV{U: v.V1, V: v.V2})
			}
			for _, v := range cmdC.Unpack.V4_8 {
				sub.Normals = append(sub.Normals, Normal{X: float32(v.V1) / 255.0, Y: float32(v.V2) / 255.0, Z: float32(v.V3) / 255.0})
			}
		}

		parentMesh.SubMeshes = append(parentMesh.SubMeshes, sub)
	}

	// Reassemble into ordered Geometry
	var finalMeshes []Mesh
	for _, tex := range textures.TextureEnties {
		if m, ok := meshMap[tex.ELDAOffset]; ok {
			finalMeshes = append(finalMeshes, *m)
		}
	}

	return &Geometry{Meshes: finalMeshes}, nil
}
