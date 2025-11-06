package cmd

import (
	"fmt"
	"io/fs"
	"os"
	"path/filepath"
	"strings"

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
		err := extractData(inputDir, outputDir, doConvert, makeSubfolders)
		return err
	},
}

func extractData(inputDir, outputDir string, convert, subfolders bool) error {

	err := filepath.WalkDir(inputDir, func(path string, d fs.DirEntry, err error) error {
		if err != nil {
			return err
		}

		// Check for .TRK extension (case-insensitive)
		if strings.EqualFold(filepath.Ext(d.Name()), ".TRK") {

			// Get the file name without extension
			baseName := strings.TrimSuffix(d.Name(), filepath.Ext(d.Name()))
			subDir := filepath.Join(outputDir, baseName)

			// Create the subdirectory
			if err := os.MkdirAll(subDir, 0755); err != nil {
				return fmt.Errorf("failed to create subdirectory %s: %w", subDir, err)
			}

			fmt.Println("Created output directory:", subDir)
		}

		return nil
	})

	return err
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
