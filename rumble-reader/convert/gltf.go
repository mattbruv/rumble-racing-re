package convert

import (
	"bytes"
	"fmt"
	"rumble-reader/asset/o3d"

	"github.com/qmuntal/gltf"
	"github.com/qmuntal/gltf/modeler"
)

type Builder struct {
	doc          *gltf.Document
	textureCache map[int]int
}

func BuildGtlf(obf *o3d.Obf) []byte {
	builder := Builder{
		doc: gltf.NewDocument(),

		textureCache: make(map[int]int),
	}

	builder.addNode(obf.RootNode)

	var buf bytes.Buffer
	enc := gltf.NewEncoder(&buf)
	enc.AsBinary = false
	enc.Encode(builder.doc)
	return buf.Bytes()
}

func (b *Builder) ensureTexture(textureId int) (int, error) {
	if idx, ok := b.textureCache[textureId]; ok {
		return idx, nil
	}

	// URI reference — no embedding
	imageIdx := len(b.doc.Images)
	b.doc.Images = append(b.doc.Images, &gltf.Image{
		URI: fmt.Sprintf("../txf/texture_%d.png", textureId),
		// URI: fmt.Sprintf("../OUT-FEB-7/SE1 - True Grits/txf/texture_%d.png", textureId),
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
				indices   []uint32
				positions [][3]float32
				uvs       [][2]float32
				normals   [][3]float32
			)

			// fmt.Println()
			// fmt.Println(node.Metadata.HeaderOffset, "BUF", bufIdx, "STRIP COUNT:", len(buf.Strips))
			// Combine all strips in the buffer into one flat list,
			for _, strip := range buf.Primitives {
				base := uint32(len(positions))
				// fmt.Println("TYPE:", strip.PrimType.String(), strip.PrimType, "VERTS:", len(strip.Vertices))

				for i := range strip.Vertices {
					v := strip.Vertices[i]
					n := strip.Normals[i]
					u := strip.UVs[i]
					positions = append(positions, [3]float32{v.X, v.Y, v.Z})
					normals = append(normals, [3]float32{n.X, n.Y, n.Z})
					uvs = append(uvs, [2]float32{u.U, u.V})
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
					if strip.Normals[i].ADCBitSet {
						if strip.Normals[i-1].ADCBitSet == false {
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
					gltf.NORMAL:     modeler.WriteNormal(b.doc, normals),
				},
				Mode: gltf.PrimitiveTriangles,
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
