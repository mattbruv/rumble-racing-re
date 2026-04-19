package o3d

type Obf struct {
	rawData []byte

	Head *Head

	ELHEs []ELHE
	ELTLs []ELTL
	ELDAs []ELDA
}

type Head struct {
	rawData []byte
}
type ELHE struct {
	rawData []byte
}
type ELTL struct {
	rawData []byte
}
type ELDA struct {
	rawData []byte
	Data    []byte
}

func parseObf(buf []byte) (*Obf, error) {
	obfAsset := Obf{
		rawData: buf,
	}

	obfBytes := buf[0x18:]

	// fmt.Println(hex.Dump(obfBytes))
	// fmt.Println("PARSE OBF CHUNKS")

	chunks, err := parseObfChunks(obfBytes)
	if err != nil {
		return nil, err
	}

	for _, chunk := range chunks {

		// fmt.Println(chunk.MagicString())
		switch chunk.MagicString() {
		case "HEAD":
			{
				if obfAsset.Head != nil {
					panic("HEAD ALREADY SET IN OBF!")
				}
				obfAsset.Head = &Head{
					rawData: chunk.Payload,
				}
				break
			}
		case "ELHE":
			{
				obfAsset.ELHEs = append(obfAsset.ELHEs, ELHE{
					rawData: chunk.Payload,
				})
				break
			}
		case "ELTL":
			{
				obfAsset.ELTLs = append(obfAsset.ELTLs, ELTL{
					rawData: chunk.Payload,
				})
				break
			}
		case "ELDA":
			{
				obfAsset.ELDAs = append(obfAsset.ELDAs, ELDA{
					rawData: chunk.Payload,
					Data:    chunk.Payload[8:],
				})
				break
			}
		default:
			{
				panic("UNHANDLED OBF CHUNK: " + chunk.MagicString())
			}

		}

	}

	return &obfAsset, nil
}
