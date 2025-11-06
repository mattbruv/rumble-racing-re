package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

var extractCmd = &cobra.Command{
	Use:   "extract",
	Short: "Extract assets from input to output directory",
	Long:  `This command processes files from the input directory and saves results in the output directory.`,
	RunE: func(cmd *cobra.Command, args []string) error {
		inputDir, _ := cmd.Flags().GetString("input")
		outputDir, _ := cmd.Flags().GetString("output")
		doConvert, _ := cmd.Flags().GetBool("convert")
		makeSubfolders, _ := cmd.Flags().GetBool("sub-folders")
		extractData(inputDir, outputDir, doConvert, makeSubfolders)
		return nil
	},
}

func extractData(inputDir, outputDir string, convert, subfolders bool) {
	fmt.Printf("Input: %s\n", inputDir)
	fmt.Printf("Output: %s\n", outputDir)
	fmt.Printf("Convert: %v\n", convert)
	fmt.Printf("Subfolders: %v\n", subfolders)

}

func init() {
	rootCmd.AddCommand(extractCmd)

	// Required flags
	extractCmd.Flags().StringP("input", "i", "", "Input directory (required)")
	extractCmd.Flags().StringP("output", "o", "", "Output directory (required)")
	extractCmd.MarkFlagRequired("input")
	extractCmd.MarkFlagRequired("output")

	// Optional flags
	extractCmd.Flags().BoolP("convert", "c", false, "Whether to convert files")
	extractCmd.Flags().BoolP("sub-folders", "s", true, "Create sub-folders for each asset type")
}
