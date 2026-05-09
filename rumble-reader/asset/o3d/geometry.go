package o3d

import "fmt"

type Vertex struct {
	X float32
	Y float32
	Z float32
}

type Normal struct {
	ADCBitSet      bool
	IsFirstTwoVert bool

	X float32
	Y float32
	Z float32
}

type UV struct {
	U float32
	V float32
}

type Geometry struct {
	Buffers []Buffer
}

type Strip struct {
	TotalVertsInStrip int

	Vertices []Vertex
	Normals  []Normal
	UVs      []UV
}

type Buffer struct {
	NumHeaderLines int
	NumStrips      int
	// TODO: Texture Info

	Strips []Strip
}

type bufferChunks struct {
	BufferChunks []bufferChunk
}
type bufferChunk struct {
	BufferHeader []V4_32Entry
	Strips       []stripChunk
}

type triple struct {
	A UnpackData
	B UnpackData
	C UnpackData
}

type stripChunk struct {
	StripHeader V4_32Entry

	// DataTriples stores groups of (A, B, C) unpacks belonging to this header
	DataTriples []triple
}

func GetGeometry(commandStream []VifCommand) (*Geometry, error) {
	var filtered []VifCommand
	for _, cmd := range commandStream {
		if cmd.Kind == VifCommandUNPACK {
			filtered = append(filtered, cmd)
		}
	}

	chunks, err := getBufferChunks(filtered)
	if err != nil {
		return nil, err
	}

	geometry := &Geometry{}

	for _, bChunk := range chunks.BufferChunks {
		buf := Buffer{
			NumStrips:      int(bChunk.BufferHeader[0].V1),
			NumHeaderLines: int(bChunk.BufferHeader[0].V2),
		}

		for _, sChunk := range bChunk.Strips {
			strip := Strip{
				TotalVertsInStrip: int(sChunk.StripHeader.V1 & 0x7fff),
			}

			// Process every triple associated with this strip header
			for _, triple := range sChunk.DataTriples {
				// if len(triple) < 3 {
				// 	continue // Or handle unexpected partial data
				// }

				cmdA, cmdB, cmdC := triple.A, triple.B, triple.C

				switch {
				case cmdA.Type == UnpackTypeV3_32 && cmdB.Type == UnpackTypeV3_32 && cmdC.Type == UnpackTypeV2_32:
					for j := 0; j < len(cmdA.V3_32); j++ {
						ignore := j == 0 || j == 1
						strip.Normals = append(strip.Normals, Normal{X: cmdA.V3_32[j].V1, Y: cmdA.V3_32[j].V2, Z: cmdA.V3_32[j].V3, ADCBitSet: cmdA.V3_32[j].ADCBitSet, IsFirstTwoVert: ignore})
						strip.Vertices = append(strip.Vertices, Vertex{X: cmdB.V3_32[j].V1, Y: cmdB.V3_32[j].V2, Z: cmdB.V3_32[j].V3})
						strip.UVs = append(strip.UVs, UV{U: cmdC.V2_32[j].V1, V: cmdC.V2_32[j].V2})
					}

				case cmdA.Type == UnpackTypeV3_32 && cmdB.Type == UnpackTypeV2_32 && cmdC.Type == UnpackTypeV4_8:
					for j := 0; j < len(cmdA.V3_32); j++ {
						ignore := j == 0 || j == 1
						strip.Vertices = append(strip.Vertices, Vertex{X: cmdA.V3_32[j].V1, Y: cmdA.V3_32[j].V2, Z: cmdA.V3_32[j].V3})
						strip.UVs = append(strip.UVs, UV{U: cmdB.V2_32[j].V1, V: cmdB.V2_32[j].V2})
						strip.Normals = append(strip.Normals, Normal{
							X:              float32(cmdC.V4_8[j].V1) / 255.0,
							Y:              float32(cmdC.V4_8[j].V2) / 255.0,
							Z:              float32(cmdC.V4_8[j].V3) / 255.0,
							ADCBitSet:      cmdC.V4_8[j].ADCBitSet,
							IsFirstTwoVert: ignore,
						})
					}
				}
			}
			buf.Strips = append(buf.Strips, strip)
		}
		geometry.Buffers = append(geometry.Buffers, buf)
	}

	return geometry, nil
}

func getBufferChunks(filtered []VifCommand) (*bufferChunks, error) {
	result := &bufferChunks{}
	i := 0

	for i < len(filtered) {
		// Buffer Boundary: Two consecutive V4_32s
		if i+1 < len(filtered) &&
			filtered[i].Unpack.Type == UnpackTypeV4_32 &&
			filtered[i+1].Unpack.Type == UnpackTypeV4_32 {

			chunk := bufferChunk{
				BufferHeader: filtered[i].Unpack.V4_32,
			}
			i++ // Advance past the buffer header

			// Collect strips within this buffer
			for i < len(filtered) {
				// Stop if we hit the next buffer (two V4_32s)
				if i+1 < len(filtered) &&
					filtered[i].Unpack.Type == UnpackTypeV4_32 &&
					filtered[i+1].Unpack.Type == UnpackTypeV4_32 {
					break
				}

				// Expect a Strip Header
				if filtered[i].Unpack.Type != UnpackTypeV4_32 {
					return nil, fmt.Errorf("expected strip header at index %d", i)
				}

				sChunk := stripChunk{}
				if len(filtered[i].Unpack.V4_32) > 0 {
					sChunk.StripHeader = filtered[i].Unpack.V4_32[0]
				}
				i++

				// Collect all following A, B, C triples until the next V4_32 header
				for i < len(filtered) && filtered[i].Unpack.Type != UnpackTypeV4_32 {
					tripl := make([]UnpackData, 0, 3)
					for j := 0; j < 3 && i < len(filtered); j++ {
						if filtered[i].Unpack.Type == UnpackTypeV4_32 {
							break
						}
						tripl = append(tripl, *filtered[i].Unpack)
						i++
					}
					if len(tripl) > 2 {
						sChunk.DataTriples = append(sChunk.DataTriples, triple{A: tripl[0], B: tripl[1], C: tripl[2]})
					} else {
						// TODO: figure out why this happens
						// fmt.Println("Missing triple!")
					}
				}
				chunk.Strips = append(chunk.Strips, sChunk)
			}
			result.BufferChunks = append(result.BufferChunks, chunk)
		} else {
			i++
		}
	}
	return result, nil
}
