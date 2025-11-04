package main

import (
	"encoding/hex"
	"fmt"
	"os"
	"rumble-reader/chunk/shoc"
)

func main() {
	file := "./strings.rdat"
	data, err := os.ReadFile(file)
	data = data[4:]
	if err != nil {
		panic(err)
	}

	res, foo := shoc.Decompress(data)
	fmt.Println(res, foo)
	fmt.Println(hex.Dump(res))

}
