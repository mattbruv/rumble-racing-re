package main

func main() {
	track := ReadTrackFile("TRK/SE1.TRK")

	for _, c := range track.Chunks {
		c.print(true)
	}
}
