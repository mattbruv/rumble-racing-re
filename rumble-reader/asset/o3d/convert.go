package o3d

import (
	"bytes"
	"fmt"
	"rumble-reader/asset"
	"rumble-reader/chunk/shoc"

	"github.com/qmuntal/gltf"
)

func BuildGtlf(obf *Obf) []byte {
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

func (r *O3D) GetType() string {
	return "o3d"
}

func (t *O3D) RawData() []byte {
	return t.rawData
}

func (t *O3D) Header() shoc.SHDR {
	return t.shocHeader
}

func (o *O3D) GetConvertedFiles(name string) []asset.ConvertedAssetFile {
	var out []asset.ConvertedAssetFile

	for obf_idx, obf := range o.Obfs {
		buf := BuildGtlf(obf)
		out = append(out, asset.ConvertedAssetFile{
			FullFileName: fmt.Sprintf("%s_%d_.gltf", o.resourceName, obf_idx),
			Data:         buf,
		})
	}

	return out
}

func (o *Obf) GetType() string {
	return "o3d"
}

func (o *Obf) RawData() []byte {
	return o.RawBytes
}

// func (o *Obf) Header() shoc.SHDR {
// 	return o.shocHeader
// }

func (o *Obf) GetConvertedFiles(name string) []asset.ConvertedAssetFile {
	var out []asset.ConvertedAssetFile

	bytes := BuildGtlf(o)

	out = append(out, asset.ConvertedAssetFile{
		FullFileName: fmt.Sprintf("%s.gltf", name),
		Data:         bytes,
	})

	return out
}
