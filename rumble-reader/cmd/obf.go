package cmd

import (
	"encoding/hex"
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

var obfCmd = &cobra.Command{
	Use:   "obf",
	Short: "Test command for parsing Obfs",
	Long:  `Test command for parsing Obfs`,
	RunE: func(cmd *cobra.Command, args []string) error {

		bin, err := os.ReadFile("../stop.gmd")

		if err != nil {
			panic("Missing test file")
		}

		fmt.Println(hex.Dump(bin))

		return nil
	},
}

func init() {
	rootCmd.AddCommand(obfCmd)
}
