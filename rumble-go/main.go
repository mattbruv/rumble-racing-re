package main

func main() {
	chunks := ReadTrackFile("TRK/FE2.TRK")

	for _, c := range chunks {
		if c.FourCC == "SHOC" && c.Index > 3 {
			c.print(true)
			break
		}
	}
}
