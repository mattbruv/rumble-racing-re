package cmd

import (
	"fmt"
	"os"
	"rumble-reader-cli/convert"
	"rumble-reader/asset/o3d"
	"rumble-reader/chunk/shoc"

	"github.com/spf13/cobra"
)

var o3daCmd = &cobra.Command{
	Use:   "o3da",
	Short: "Test o3da parse",
	Long:  `test o3da parsing`,
	RunE: func(cmd *cobra.Command, args []string) error {

		data, err := os.ReadFile("../OUT-FEB-7/SE1 - True Grits/o3da/4_RCES-TURNARROWANIM.O3DA.o3da")

		if err != nil {
			panic(err)
		}

		o3dData, err := o3d.ParseO3D(true, data, shoc.SHDR{}, "test")

		// panic(len(o3dData.Gmds))

		for obf_index, obf := range o3dData.Obfs {

			os.WriteFile(fmt.Sprintf("./O3DA_OBF_%d.obf", obf_index), obf.RawBytes, 0644)

			for _, file := range convert.ConvertO3DAsset(o3dData, o3dData.Name(), convert.DefaultTextureURI) {
				os.WriteFile(fmt.Sprintf("./%s", file.FullFileName), file.Data, 0644)
			}
		}

		return nil
	},
}

func init() {
	rootCmd.AddCommand(o3daCmd)
}
