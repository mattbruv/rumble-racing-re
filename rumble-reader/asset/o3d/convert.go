package o3d

import (
	"fmt"
	"rumble-reader/asset"
	"rumble-reader/chunk/shoc"
	"strings"
)

/*
	AI slop file to vibe render/research how the VIF/models working
*/

func (o *O3D) GetConvertedFiles() []asset.ConvertedAssetFile {
	var out []asset.ConvertedAssetFile

	for obfIdx, obf := range o.Obfs {
		for eldaIdx, elda := range obf.ELDAs {
			if len(elda.Data) == 0 {
				continue
			}

			entries := elda.ParseVif()
			strips := extractStrips(entries)
			if len(strips) == 0 {
				continue
			}

			mesh := stripsToMesh(strips)
			objData := writeOBJ(mesh)

			out = append(out, asset.ConvertedAssetFile{
				FullFileName: fmt.Sprintf("%s_obf_%d_elda_%d.obj", o.resourceName, obfIdx, eldaIdx),
				Data:         objData,
			})
		}
	}

	return out
}

// strip holds one (norm, pos, uv) triplet from the VIF stream
type strip struct {
	normals   []V3_32
	positions []V3_32
	uvs       []V2_32
}

// extractStrips groups consecutive (V3 norm, V3 pos, V2 uv) triplets
func extractStrips(entries []UnpackData) []strip {
	var strips []strip
	i := 0
	for i < len(entries) {
		// skip V4 blocks (matrices / header data)
		if _, ok := entries[i].(UnpackV4_32); ok {
			i++
			continue
		}

		// expect triplet: V3 normals, V3 positions, V2 uvs
		if i+2 >= len(entries) {
			break
		}
		norms, ok0 := entries[i].(UnpackV3_32)
		pos, ok1 := entries[i+1].(UnpackV3_32)
		uvs, ok2 := entries[i+2].(UnpackV2_32)

		if !ok0 || !ok1 || !ok2 {
			i++
			continue
		}
		if len(norms.Data) != len(pos.Data) || len(pos.Data) != len(uvs.Data) {
			i++
			continue
		}

		s := strip{
			normals:   make([]V3_32, len(norms.Data)),
			positions: make([]V3_32, len(pos.Data)),
			uvs:       make([]V2_32, len(uvs.Data)),
		}
		for j, v := range norms.Data {
			s.normals[j] = V3_32{v.V1, v.V2, v.V3}
		}
		for j, v := range pos.Data {
			s.positions[j] = V3_32{v.V1, v.V2, v.V3}
		}
		for j, v := range uvs.Data {
			s.uvs[j] = V2_32{v.V1, v.V2}
		}

		strips = append(strips, s)
		i += 3
	}
	return strips
}

type mesh struct {
	positions [][3]float32
	normals   [][3]float32
	uvs       [][2]float32
	indices   [][3][3]int // [tri][vert] = [posIdx, uvIdx, normIdx] 1-based
}

func stripsToMesh(strips []strip) mesh {
	var m mesh
	for _, s := range strips {
		base := len(m.positions) // 0-based offset before adding this strip

		for _, p := range s.positions {
			m.positions = append(m.positions, [3]float32{p.V1, p.V2, p.V3})
		}
		for _, n := range s.normals {
			m.normals = append(m.normals, [3]float32{n.V1, n.V2, n.V3})
		}
		for _, uv := range s.uvs {
			// Updated the UV push into the mesh to invert the V coordinate:
			m.uvs = append(m.uvs, [2]float32{uv.V1, 1.0 - uv.V2})
		}

		// triangle strip decomposition, alternating winding
		for i := 0; i < len(s.positions)-2; i++ {
			var i0, i1, i2 int
			if i%2 == 0 {
				i0, i1, i2 = i, i+1, i+2
			} else {
				i0, i1, i2 = i, i+2, i+1
			}
			// OBJ indices are 1-based
			ref := func(idx int) [3]int {
				n := base + idx + 1
				return [3]int{n, n, n} // pos/uv/norm share same index
			}
			m.indices = append(m.indices, [3][3]int{ref(i0), ref(i1), ref(i2)})
		}
	}
	return m
}

func writeOBJ(m mesh) []byte {
	var b strings.Builder

	b.WriteString("# Exported from O3D\n\n")

	for _, v := range m.positions {
		fmt.Fprintf(&b, "v %f %f %f\n", v[0], v[1], v[2])
	}
	b.WriteByte('\n')

	for _, uv := range m.uvs {
		fmt.Fprintf(&b, "vt %f %f\n", uv[0], uv[1])
	}
	b.WriteByte('\n')

	for _, n := range m.normals {
		fmt.Fprintf(&b, "vn %f %f %f\n", n[0], n[1], n[2])
	}
	b.WriteByte('\n')

	b.WriteString("g mesh\n")
	for _, tri := range m.indices {
		fmt.Fprintf(&b, "f %d/%d/%d %d/%d/%d %d/%d/%d\n",
			tri[0][0], tri[0][1], tri[0][2],
			tri[1][0], tri[1][1], tri[1][2],
			tri[2][0], tri[2][1], tri[2][2],
		)
	}

	return []byte(b.String())
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
