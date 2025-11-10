package cmd

import (
	"rumble-reader/asset"

	"github.com/spf13/cobra"
)

var testCmd = &cobra.Command{
	Use:   "test",
	Short: "test o3d",
	Long:  `test o3d`,
	RunE: func(cmd *cobra.Command, args []string) error {

		asset.ParseO3d()
		return nil
	},
}

func init() {
	rootCmd.AddCommand(testCmd)
}
