package cmd

import (
	"fmt"
	"os"
	"rumble-reader/asset/o3d"

	"github.com/spf13/cobra"
)

var obfCmd = &cobra.Command{
	Use:   "obf",
	Short: "Test obf parse",
	Long:  `test obf parsing`,
	RunE: func(cmd *cobra.Command, args []string) error {

		data, err := os.ReadFile("../OUT-FEB-7/SE1 - True Grits/obf/1_-RESOURCES-TRACK.OBF.obf")
		// data, err := os.ReadFile("../OUT-FEB-7/SE2 - Over Easy/obf/1_-RESOURCES-TRACK.OBF.obf")
		// data, err := os.ReadFile("../OUT-FEB-7/SE2 - Over Easy/obf/2_-RESOURCES-TRACKPAN.OBF.obf")

		if err != nil {
			panic(err)
		}

		obf, err := o3d.ParseObf(data)

		bytes := o3d.BuildGtlf(obf)
		os.WriteFile("./MAP_TEST.gltf", bytes, 0644)

		vifText := obf.DumpAllVifText()
		vifFileName := fmt.Sprintf("MAP_vif_dump_%d.txt")
		os.WriteFile(vifFileName, []byte(vifText), 0644)

		// obj := o3d.NodeToJson(obf.RootNode)
		// b, err := json.MarshalIndent(obj, "", "  ")
		// if err != nil {
		// 	log.Fatal(err)
		// }
		// fmt.Println(string(b))

		return nil
	},
}

func init() {
	rootCmd.AddCommand(obfCmd)
}
