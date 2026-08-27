package convert

import (
	"bytes"
	"fmt"
	"rumble-reader/asset/o3d"

	"github.com/qmuntal/gltf"
	"github.com/qmuntal/gltf/modeler"
)

type Builder struct {
	doc            *gltf.Document
	textureCache   map[int]int
	resolveTexture TextureResolver
}

func BuildGtlf(obf *o3d.Obf, resolveTexture TextureResolver) []byte {
	if resolveTexture == nil {
		resolveTexture = DefaultTextureURI
	}

	builder := Builder{
		doc: gltf.NewDocument(),

		textureCache:   make(map[int]int),
		resolveTexture: resolveTexture,
	}

	builder.addNode(obf.RootNode)

	var buf bytes.Buffer
	enc := gltf.NewEncoder(&buf)
	enc.AsBinary = false
	enc.Encode(builder.doc)
	return buf.Bytes()
}

func colorToBytes(c o3d.Color) [4]uint8 {
	to8 := func(f float32) uint8 {
		v := f * 255.0
		if v < 0 {
			v = 0
		}
		if v > 255 {
			v = 255
		}
		return uint8(v + 0.5)
	}
	return [4]uint8{to8(c.R), to8(c.G), to8(c.B), to8(c.A)}
}

func (b *Builder) ensureTexture(textureId int) (int, error) {
	if idx, ok := b.textureCache[textureId]; ok {
		return idx, nil
	}

	// URI reference — no embedding
	imageIdx := len(b.doc.Images)
	b.doc.Images = append(b.doc.Images, &gltf.Image{
		URI: b.resolveTexture(textureId),
	})

	// Sampler
	samplerIdx := len(b.doc.Samplers)
	b.doc.Samplers = append(b.doc.Samplers, &gltf.Sampler{
		MagFilter: gltf.MagLinear,
		MinFilter: gltf.MinLinearMipMapLinear,
		WrapS:     gltf.WrapRepeat,
		WrapT:     gltf.WrapRepeat,
	})

	// Texture
	textureIdx := len(b.doc.Textures)
	b.doc.Textures = append(b.doc.Textures, &gltf.Texture{
		Source:  &imageIdx,
		Sampler: &samplerIdx,
	})

	// Material
	materialIdx := len(b.doc.Materials)
	b.doc.Materials = append(b.doc.Materials, &gltf.Material{
		DoubleSided: true,
		AlphaMode:   gltf.AlphaMask,
		AlphaCutoff: gltf.Float(0.5),
		PBRMetallicRoughness: &gltf.PBRMetallicRoughness{
			BaseColorTexture: &gltf.TextureInfo{
				Index: textureIdx,
			},
			MetallicFactor:  gltf.Float(0),
			RoughnessFactor: gltf.Float(1),
		},
	})

	b.textureCache[textureId] = materialIdx
	return materialIdx, nil
}

func (b *Builder) addNode(node *o3d.ObfNode) int {
	gltfNode := &gltf.Node{
		Name: fmt.Sprintf("%d", node.Metadata.HeaderOffset),
	}
	index := len(b.doc.Nodes)
	b.doc.Nodes = append(b.doc.Nodes, gltfNode)

	if node != nil && node.RawChunk.ELDA.Raw.Size > 8 {
		for bufIdx, buf := range node.Geometry.Buffers {
			var (
				indices    []uint32
				positions  [][3]float32
				uvs        [][2]float32
				normals    [][3]float32
				colors     [][4]uint8
				hasNormals bool
				hasColors  bool
			)

			// fmt.Println()
			// fmt.Println(node.Metadata.HeaderOffset, "BUF", bufIdx, "STRIP COUNT:", len(buf.Strips))
			// Combine all strips in the buffer into one flat list,
			for _, strip := range buf.Primitives {
				base := uint32(len(positions))
				// fmt.Println("TYPE:", strip.PrimType.String(), strip.PrimType, "VERTS:", len(strip.Vertices))

				hasNormals = hasNormals || len(strip.Normals) > 0
				hasColors = hasColors || len(strip.Colors) > 0

				for i := range strip.Vertices {
					v := strip.Vertices[i]
					u := strip.UVs[i]
					positions = append(positions, [3]float32{v.X, v.Y, v.Z})
					uvs = append(uvs, [2]float32{u.U, u.V})

					if i < len(strip.Normals) {
						n := strip.Normals[i]
						normals = append(normals, [3]float32{n.X, n.Y, n.Z})
					} else {
						normals = append(normals, [3]float32{0, 0, 1})
					}

					if i < len(strip.Colors) {
						colors = append(colors, colorToBytes(strip.Colors[i]))
					} else {
						colors = append(colors, [4]uint8{255, 255, 255, 255})
					}
				}

				/*
					isFlipped = false
					for each vtx:
					   if draw:
					       if prev was not draw:
					           isFlipped = false
					       else:
					           isFlipped = not isFlipped
					       # add vertex
				*/
				isFlipped := false
				for i := 2; i < len(strip.Vertices); i++ {
					if strip.Vertices[i].ADCBitSet {
						if strip.Vertices[i-1].ADCBitSet == false {
							isFlipped = false
						} else {
							isFlipped = !isFlipped
						}
						A, B, C := base+uint32(i-2), base+uint32(i-1), base+uint32(i)
						if isFlipped {
							indices = append(indices, A, B, C)
						} else {
							indices = append(indices, B, A, C)
						}
					}
				}
			}

			if len(indices) == 0 {
				continue
			}

			prim := &gltf.Primitive{
				Indices: gltf.Index(modeler.WriteIndices(b.doc, indices)),
				Attributes: gltf.PrimitiveAttributes{
					gltf.POSITION:   modeler.WritePosition(b.doc, positions),
					gltf.TEXCOORD_0: modeler.WriteTextureCoord(b.doc, uvs),
				},
				Mode: gltf.PrimitiveTriangles,
			}

			if hasNormals {
				prim.Attributes[gltf.NORMAL] = modeler.WriteNormal(b.doc, normals)
			}
			if hasColors {
				prim.Attributes[gltf.COLOR_0] = modeler.WriteColor(b.doc, colors)
			}

			if buf.TextureId >= 0 {
				materialIdx, err := b.ensureTexture(buf.TextureId)
				if err == nil {
					prim.Material = gltf.Index(materialIdx)
				}
			}

			mesh := &gltf.Mesh{
				Name:       fmt.Sprintf("%d_buf%d", node.Metadata.HeaderOffset, bufIdx),
				Primitives: []*gltf.Primitive{prim},
			}
			b.doc.Meshes = append(b.doc.Meshes, mesh)
			mi := len(b.doc.Meshes) - 1
			bufNode := &gltf.Node{
				Name: fmt.Sprintf("%d_buf%d", node.Metadata.HeaderOffset, bufIdx),
				Mesh: &mi,
			}
			b.doc.Nodes = append(b.doc.Nodes, bufNode)
			bi := len(b.doc.Nodes) - 1
			gltfNode.Children = append(gltfNode.Children, bi)
		}
	}

	child := node.LastChild
	for child != nil {
		childIndex := b.addNode(child)
		gltfNode.Children = append(gltfNode.Children, childIndex)
		child = child.PrevSibling
	}
	return index
}
