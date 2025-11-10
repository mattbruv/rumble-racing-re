package asset

import (
	"os"
)

func ParseO3d() {
	file := "../test.o3d"
	data, err := os.ReadFile(file)
	if err != nil {
		panic(err)
	}

	println(len(data))
}
