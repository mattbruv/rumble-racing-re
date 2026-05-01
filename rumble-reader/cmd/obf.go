package cmd

import (
	"encoding/json"
	"fmt"
	"log"
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

		if err != nil {
			panic(err)
		}

		obf, err := o3d.ParseObf(data)

		obj := o3d.NodeToJson(obf.RootNode)
		b, err := json.MarshalIndent(obj, "", "  ")
		if err != nil {
			log.Fatal(err)
		}
		fmt.Println(string(b))

		return nil
	},
}

func init() {
	rootCmd.AddCommand(obfCmd)
}
