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

		data, err := os.ReadFile("../OUT-FEB-7/SE2 - Over Easy/txf/1_-RESOURCES-TRACK.TXF.txf")
		// data, err := os.ReadFile("../testbad.txf")

		if err != nil {
			panic("unable to open file")
		}

		txf, err := txf.ParseTXF(data, shoc.SHDR{}, "test")

		if err != nil {
			panic(err)
		}

		if txf != nil {

			textures := txf.GetTextures()

			for _, tx := range textures {
				// if tx.Name != "texture_6144" {
				// 	// fmt.Println(tx.Files[0].Image.Pix)
				// 	// continue
				// }
				for _, texFile := range tx.Files {
					name := fmt.Sprintf("../test/%s.png", tx.Name)
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
