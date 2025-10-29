package main

func main() {
	chunks := ReadTrackFile("TRK/SE1.TRK")

	for _, c := range chunks {
		c.print(true)
	}
}
