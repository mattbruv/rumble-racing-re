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

		// data, err := os.ReadFile("../OUT-FEB-7/SE1 - True Grits/o3d/19_ESOURCES-GSTARTPOLE.O3D.o3d")
		// data, err := os.ReadFile("../OUT-FEB-7/SE1 - True Grits/o3d/23_SOURCES-SE_CHICKENA.O3D.o3d")
		data, err := os.ReadFile("../OUT-FEB-7/FE2/o3d/1000_S-SPLINEMAPS-TRKDA1.O3D.o3d")
		// data, err := os.ReadFile("../OUT-FEB-7/GLBLDATA/o3d/5001_BJECTS-TWISTERPART1.O3D.o3d")
		// data, err := os.ReadFile("../eagle.o3d")

		if err != nil {
			panic(err)
		}

		// fmt.Println(hex.Dump(data))

		o3dData, err := o3d.ParseO3D(data, shoc.SHDR{}, "test")

		for obf_index, obf := range o3dData.Obfs {

			os.WriteFile("./CHICKEN_RAW.obf", obf.RawBytes, 0644)

			vifText := obf.DumpAllVifText()
			vifFileName := fmt.Sprintf("CHICKEN_vif_dump_%d.txt", obf_index)

			for _, file := range o3dData.GetConvertedFiles("idk") {
				os.WriteFile(fmt.Sprintf("./%s", file.FullFileName), file.Data, 0644)
			}

			os.WriteFile(vifFileName, []byte(vifText), 0644)

			// obj := o3d.NodeToJson(obf.RootNode)
			// b, err := json.MarshalIndent(obj, "", "  ")
			// if err != nil {
			// 	log.Fatal(err)
			// }
			// fmt.Println(string(b))
		}

		// for _, thing := range o3dData.Obf.ELDAs {
		// 	// fmt.Println(hex.Dump(thing.Data), len(thing.Data))
		// 	if len(thing.Data) > 0 {
		// 		// os.WriteFile("./out.bin", thing.Data, 0644)
		// 		unpacked := thing.ParseVif()

		// 		for _, entry := range unpacked {
		// 			switch x := entry.(type) {
		// 			case o3d.UnpackV4_32:
		// 				{
		// 					fmt.Println("V4 Offset:", x.Offset)
		// 					for _, e := range x.Data {
		// 						fmt.Println(e.V1, e.V2, e.V3, e.V4)
		// 					}
		// 					fmt.Println()
		// 					break
		// 				}
		// 			case o3d.UnpackV3_32:
		// 				{
		// 					fmt.Println("V3 Offset:", x.Offset)
		// 					for _, e := range x.Data {
		// 						fmt.Println(e.V1, e.V2, e.V3)
		// 					}
		// 					fmt.Println()
		// 					break
		// 				}
		// 			case o3d.UnpackV2_32:
		// 				{
		// 					fmt.Println("V2 Offset:", x.Offset)
		// 					for _, e := range x.Data {
		// 						fmt.Println(e.V1, e.V2)
		// 					}
		// 					fmt.Println()
		// 					break
		// 				}
		// 			}

		// 		}
		// 	}
		// }
		// if err != nil {
		// 	panic(err)
		// }

		return nil
	},
}

func init() {
	rootCmd.AddCommand(o3dCmd)
}
