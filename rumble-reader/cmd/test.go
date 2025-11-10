package cmd

import (
	"encoding/hex"
	"fmt"
	"rumble-reader/asset"

	"github.com/spf13/cobra"
)

var testCmd = &cobra.Command{
	Use:   "test",
	Short: "test o3d",
	Long:  `test o3d`,
	RunE: func(cmd *cobra.Command, args []string) error {

		model := asset.Test03D()

		for _, section := range model.Obf.Sections {
			if eltl, ok := section.(*asset.ELDA); ok {
				fmt.Println(hex.Dump(eltl.Data))
			}
		}

		fmt.Println(len(model.Obf.Sections))
		return nil
	},
}

func init() {
	rootCmd.AddCommand(testCmd)
}
