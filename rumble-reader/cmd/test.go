package cmd

import (
	"fmt"
	"os"
	"rumble-reader/asset/txf"

	"github.com/spf13/cobra"
)

var testCmd = &cobra.Command{
	Use:   "test",
	Short: "Test TXF parse",
	Long:  `test tfx parsing`,
	RunE: func(cmd *cobra.Command, args []string) error {

		data, err := os.ReadFile("../test.txf")

		if err != nil {
			panic("unable to open file")
		}

		txf, err := txf.ParseTXF(data)

		if err != nil {
			panic(err)
		}

		fmt.Println(txf)
		return nil
	},
}

func init() {
	rootCmd.AddCommand(testCmd)
}
