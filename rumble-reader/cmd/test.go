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

		// data, err := os.ReadFile("../test.txf")
		data, err := os.ReadFile("../OUT/FE2/txf/10000_RS-TXF-STOCKCAR_1_A.TXF.txf")

		if err != nil {
			panic("unable to open file")
		}

		txf, err := txf.ParseTXF(data)

		if err != nil {
			panic(err)
		}

		if txf != nil {
			// fmt.Println(hex.Dump(txf.CLUTData.RawData))
			// fmt.Println(len(txf.CLUTData.RawData))
			// for i, entry := range txf.CLUTHeader.Entries {
			// 	fmt.Println(i, "start:", entry.CLDAStartOffset, "sizeLookup:", entry.CLUTImageSizeLookup, "format:", entry.PixelFormat, "vram:", entry.VRAM_Dest)
			// }

			for _, tex := range txf.TextureHeaders {
				fmt.Println(tex)
			}

		}
		return nil
	},
}

func init() {
	rootCmd.AddCommand(testCmd)
}
