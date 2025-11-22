package cmd

import (
	"fmt"
	"image/png"
	"os"
	"rumble-reader/asset/txf"
	"rumble-reader/chunk/shoc"

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

		txf, err := txf.ParseTXF(data, shoc.SHDR{})

		if err != nil {
			panic(err)
		}

		if txf != nil {

			textures := txf.GetTextures()

			for _, tx := range textures {
				fmt.Println(tx.Name)
				for f, texFile := range tx.Files {
					name := fmt.Sprintf("../test/%s_%d_%dx%d.png", tx.Name, f, texFile.Width, texFile.Height)
					outFile, err := os.Create(name)
					if err != nil {
						panic(err)
					}
					defer outFile.Close()
					png.Encode(outFile, texFile.Image)
				}
			}
		}
		return nil
	},
}

func init() {
	rootCmd.AddCommand(testCmd)
}
