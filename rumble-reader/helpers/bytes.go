package helpers

func ReverseBytesInPlace(b []byte) {
	for i, j := 0, len(b)-1; i < j; i, j = i+1, j-1 {
		b[i], b[j] = b[j], b[i]
	}
}

func GetNextFourCC(b []byte) string {
	slice := append([]byte(nil), b[0:4]...) // make a copy
	ReverseBytesInPlace(slice)
	return string(slice)
}
