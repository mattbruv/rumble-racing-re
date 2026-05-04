package o3d

import (
	"encoding/binary"
	"encoding/hex"
	"fmt"
	"log"
	"strings"

	"github.com/qmuntal/gltf"
	"github.com/qmuntal/gltf/modeler"
)

type Obf struct {
	RawBytes []byte

	RawObfChunks []ObfChunk
	RootNode     *ObfNode
}

type ObfNodeJson struct {
	Metadata NodeMetadata   `json:"metadata"`
	Children []*ObfNodeJson `json:"children,omitempty"`
}

type TextureEntry struct {
	ELDAOffset uint32
	TextureId  int
}
type TextureMeta struct {
	NumTextures   int16
	TextureEnties []TextureEntry
}

type NodeMetadata struct {
	X float32
	Y float32
	Z float32
	W float32

	RawZDebug   string
	RawZAddress int

	DataLen      int
	HeaderOffset int

	TextureMetadata TextureMeta
}

type ObfNode struct {
	RawChunk ObfChunk
	Metadata NodeMetadata
	Geometry *Geometry

	Parent      *ObfNode // 0x1C
	LastChild   *ObfNode // 0x20
	PrevSibling *ObfNode // 0x24
	Child       *ObfNode // 0x28
}

func ParseObf(buf []byte) (*Obf, error) {

	// Skip past the .Obf header, like the game does
	obfBytes := buf[0x18:]

	obfAsset := Obf{
		RawBytes: obfBytes,
		RootNode: &ObfNode{},
	}

	// fmt.Println(hex.Dump(obfBytes))
	// fmt.Println("PARSE OBF CHUNKS")

	chunks, err := parseObfChunks(obfBytes)
	if err != nil {
		return nil, err
	}

	obfAsset.RawObfChunks = chunks

	buildTree(obfAsset.RootNode, 0, chunks)

	return &obfAsset, nil
}

func buildTree(node *ObfNode, currDataIndex int, data []ObfChunk) int {
	node.RawChunk = data[currDataIndex]

	node.Metadata.X = node.RawChunk.ELHE.X
	node.Metadata.Y = node.RawChunk.ELHE.Y
	node.Metadata.Z = node.RawChunk.ELHE.Z
	node.Metadata.W = node.RawChunk.ELHE.W
	node.Metadata.DataLen = int(len(node.RawChunk.ELDA.Raw.Payload))
	node.Metadata.HeaderOffset = node.RawChunk.ELHE.Raw.Offset
	node.Metadata.RawZDebug = fmt.Sprintf("%08x", node.RawChunk.ELHE.RawZDebug)
	node.Metadata.RawZAddress = node.RawChunk.ELHE.RawZAddress

	vif, err := node.RawChunk.ELDA.ParseVif()

	if err != nil {
		panic(err)
	}

	// Build texture metadata from ELTL/ELDA data
	node.Metadata.TextureMetadata = buildTextureMetadata(node.RawChunk.ELHE, node.RawChunk.ELTL, node.RawChunk.ELDA)

	geometry, err := vif.GetGeometry(node.Metadata.TextureMetadata)

	if err != nil {
		panic(err)
	}

	node.Geometry = geometry

	// for _, submesh := range geometry.SubMeshes {
	// 	fmt.Println("GEOMETRY: ", submesh.Texture)
	// }
	// node.Metadata.VifCommandCount = len(vif.Commands)

	nodeCount := 1

	if node.RawChunk.ELHE.ChildCount != 0 {
		var lastChild *ObfNode
		nextDataIndex := currDataIndex + 1

		for i := 0; i < int(node.RawChunk.ELHE.ChildCount); i++ {
			childNode := &ObfNode{}
			childNode.Parent = node

			if i == 0 {
				childNode.PrevSibling = nil
			} else {
				childNode.PrevSibling = lastChild
			}
			lastChild = childNode
			node.LastChild = childNode

			childNodeCount := buildTree(childNode, nextDataIndex, data)
			nextDataIndex += childNodeCount
			nodeCount += childNodeCount
		}
	}

	return nodeCount
}

func NodeToJson(node *ObfNode) *ObfNodeJson {
	j := &ObfNodeJson{
		Metadata: node.Metadata,
	}
	child := node.LastChild
	for child != nil {
		j.Children = append(j.Children, NodeToJson(child))
		child = child.PrevSibling
	}
	return j
}

func (o *Obf) DumpAllVifText() string {
	var texts []string
	for _, chunk := range o.RawObfChunks {
		texts = append(texts, hex.Dump(chunk.ELTL.Raw.Payload))
		if chunk.ELDA != nil {
			text, err := chunk.ELDA.DumpVifText()
			if err == nil {
				texts = append(texts, text)
			}
		}
	}
	return strings.Join(texts, "\n\n")
}

func buildTextureMetadata(elhe *ELHE_Header, eltl *ELTL_TextureList, elda *ELDA_Data) TextureMeta {
	textureMeta := TextureMeta{
		NumTextures:   elhe.MaybeNumTextures,
		TextureEnties: []TextureEntry{},
	}

	if elhe.MaybeNumTextures <= 0 {
		return textureMeta
	}

	eltl_data := eltl.Raw.Payload[8:]
	elda_data := elda.Raw.Payload[8:]

	for i := 0; i < int(elhe.MaybeNumTextures); i++ {
		offset := binary.LittleEndian.Uint32(eltl_data[i*4 : i*4+4])
		offset *= 4 // the game multiplies this number by four
		textureId := int(binary.LittleEndian.Uint32(elda_data[offset : offset+4]))

		entry := TextureEntry{
			ELDAOffset: offset,
			TextureId:  textureId,
		}

		textureMeta.TextureEnties = append(textureMeta.TextureEnties, entry)
	}

	return textureMeta
}

type Builder struct {
	doc *gltf.Document

	textureCache map[int]int
}

func (b *Builder) ensureTexture(textureId int) (int, error) {
	if idx, ok := b.textureCache[textureId]; ok {
		return idx, nil
	}

	// URI reference — no embedding
	imageIdx := len(b.doc.Images)
	b.doc.Images = append(b.doc.Images, &gltf.Image{
		// URI: fmt.Sprintf("./txf/texture_%d.png", textureId),
		URI: fmt.Sprintf("../OUT-FEB-7/SE1 - True Grits/txf/texture_%d.png", textureId),
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

// returns index of node in gltf document
func (b *Builder) addNode(node *ObfNode) int {
	gltfNode := &gltf.Node{
		Name: fmt.Sprintf("%d", node.Metadata.HeaderOffset),
	}

	index := len(b.doc.Nodes)
	b.doc.Nodes = append(b.doc.Nodes, gltfNode)

	// add geometry
	if node != nil && node.RawChunk.ELDA.Raw.Size > 8 {
		mesh := &gltf.Mesh{}

		meshIndex := len(b.doc.Meshes)
		b.doc.Meshes = append(b.doc.Meshes, mesh)

		for _, thing := range node.Geometry.Meshes {
			for _, subThing := range thing.SubMeshes {
				var indices []uint16
				var positions [][3]float32
				var uvs [][2]float32
				var normals [][3]float32

				for _, vertex := range subThing.Vertices {
					positions = append(positions, [3]float32{vertex.X, vertex.Y, vertex.Z})
					indices = append(indices, uint16(len(indices)))
				}

				for _, normal := range subThing.Normals {
					normals = append(normals, [3]float32{normal.X, normal.Y, normal.Z})
				}

				for _, uv := range subThing.UVs {
					uvs = append(uvs, [2]float32{uv.U, uv.V})
				}

				prim := &gltf.Primitive{
					Indices: gltf.Index(modeler.WriteIndices(b.doc, indices)),
					Attributes: gltf.PrimitiveAttributes{
						gltf.POSITION:   modeler.WritePosition(b.doc, positions),
						gltf.TEXCOORD_0: modeler.WriteTextureCoord(b.doc, uvs),
						gltf.NORMAL:     modeler.WriteNormal(b.doc, normals),
					},
					Mode: gltf.PrimitiveTriangleStrip,
					// Mode: gltf.PrimitiveLines,
					// add texture
				}

				// Attach material/texture
				if thing.Texture.TextureId != -1 {
					matIdx, err := b.ensureTexture(thing.Texture.TextureId)
					if err != nil {
						log.Printf("warn: texture %d: %v", thing.Texture.TextureId, err)
					} else {
						prim.Material = gltf.Index(matIdx)
					}
				}

				mesh.Primitives = append(mesh.Primitives, prim)
			}
		}

		gltfNode.Mesh = &meshIndex
	}

	// iterate children via linked list
	child := node.LastChild

	for child != nil {
		childIndex := b.addNode(child)
		gltfNode.Children = append(gltfNode.Children, childIndex)

		// move to sibling
		child = child.PrevSibling
	}

	return index
}
