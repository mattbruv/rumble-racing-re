package main

import (
	"fmt"
	"rumble-reader/file"
)

func main() {

	f := file.ReadTrackFile("../data/SE1.TRK")

	fmt.Println(f.FileName, f.FileSize, len(f.TopLevelChunks))

	rlst, _ := f.GetResourceList()

	fmt.Println(rlst.Count)

}
