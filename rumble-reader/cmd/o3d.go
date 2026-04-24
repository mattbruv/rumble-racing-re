package cmd

import (
	"fmt"
	"os"
	"rumble-reader/asset/o3d"
	"rumble-reader/chunk/shoc"

	"github.com/spf13/cobra"
)

var o3dCmd = &cobra.Command{
	Use:   "o3d",
	Short: "Test o3d parse",
	Long:  `test o3d parsing`,
	RunE: func(cmd *cobra.Command, args []string) error {

		data, err := os.ReadFile("../OUT-FEB-7/SE1 - True Grits/o3d/32_-RESOURCES-STOPSIGN.O3D.o3d")
		// data, err := os.ReadFile("../OUT-FEB-7/MP2 - Car Go/o3d/5_-RESOURCES-GL_L.O3D.o3d")
		// data, err := os.ReadFile("../eagle.o3d")

		if err != nil {
			panic(err)
		}

		// fmt.Println(hex.Dump(data))

		o3dData, err := o3d.ParseO3D(data, shoc.SHDR{}, "test")

		for _, thing := range o3dData.Obf.ELDAs {
			// fmt.Println(hex.Dump(thing.Data), len(thing.Data))
			if len(thing.Data) > 0 {
				// os.WriteFile("./out.bin", thing.Data, 0644)
				unpacked := thing.ParseVif()

				for _, entry := range unpacked {
					switch x := entry.(type) {
					case o3d.UnpackV4_32:
						{
							fmt.Println("V4 Offset:", x.Offset)
							for _, e := range x.Data {
								fmt.Println(e.V1, e.V2, e.V3, e.V4)
							}
							fmt.Println()
							break
						}
					case o3d.UnpackV3_32:
						{
							fmt.Println("V3 Offset:", x.Offset)
							for _, e := range x.Data {
								fmt.Println(e.V1, e.V2, e.V3)
							}
							fmt.Println()
							break
						}
					case o3d.UnpackV2_32:
						{
							fmt.Println("V2 Offset:", x.Offset)
							for _, e := range x.Data {
								fmt.Println(e.V1, e.V2)
							}
							fmt.Println()
							break
						}
					}

				}
			}
		}
		// if err != nil {
		// 	panic(err)
		// }

		// if txf != nil {

		// 	textures := txf.GetTextures()

		// 	for _, tx := range textures {
		// 		// fmt.Println(tx.Name)
		// 		for f, texFile := range tx.Files {
		// 			name := fmt.Sprintf("../test/%s_%d_%dx%d.png", tx.Name, f, texFile.Width, texFile.Height)
		// 			outFile, err := os.Create(name)
		// 			if err != nil {
		// 				panic(err)
		// 			}
		// 			defer outFile.Close()
		// 			png.Encode(outFile, texFile.Image)
		// 		}
		// 	}
		// }
		return nil
	},
}

func init() {
	rootCmd.AddCommand(o3dCmd)
}
