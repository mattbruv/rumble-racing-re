package cmd

import (
	"encoding/hex"
	"encoding/json"
	"fmt"
	"io/fs"
	"os"
	"path/filepath"
	"rumble-reader/file"
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
	// Ensure the outputDir exists
	if err := os.MkdirAll(outputDir, 0755); err != nil {
		return fmt.Errorf("failed to create output directory: %w", err)
	}

	err := filepath.WalkDir(inputDir, func(path string, d fs.DirEntry, err error) error {
		if err != nil {
			return err
		}

		if d.IsDir() {
			return nil
		}

		if strings.EqualFold(filepath.Ext(d.Name()), ".TRK") {
			baseName := strings.TrimSuffix(d.Name(), filepath.Ext(d.Name()))
			subDir := filepath.Join(outputDir, baseName)

			trackFile := file.ReadTrackFile(path)
			rlst, _ := trackFile.GetResourceList()

			if err := os.MkdirAll(subDir, 0755); err != nil {
				return fmt.Errorf("failed to create subdirectory %s: %w", subDir, err)
			}
			outFolder := subDir

			for _, entry := range rlst.Entries {
				theAsset, err := trackFile.GetResource(entry)
				if err != nil {
					return fmt.Errorf("failed to get resource: %w", err)
				}

				data := theAsset.RawData()
				if len(data) > 0 {
					if subfolders {
						outFolder = filepath.Join(subDir, theAsset.GetType())
						if err := os.MkdirAll(outFolder, 0755); err != nil {
							return fmt.Errorf("failed to create subfolder %s: %w", outFolder, err)
						}
					}

					resName := strings.ReplaceAll(entry.ResourceName, "/", "-")
					resName = strings.ReplaceAll(resName, ":", "-")

					// Append the type as file suffix/extension
					outFileName := fmt.Sprintf("%d_%s.%s", entry.ResourceIndex, resName, theAsset.GetType())
					outFilePath := filepath.Join(outFolder, outFileName)

					if err := os.WriteFile(outFilePath, data, 0644); err != nil {
						return fmt.Errorf("failed to write file %s: %w", outFilePath, err)
					}

					// write header data
					outFileName = fmt.Sprintf("%d_%s.shdr", entry.ResourceIndex, resName)
					outFilePath = filepath.Join(outFolder, outFileName)
					hdr := theAsset.Header()

					if err := os.WriteFile(outFilePath, hdr.Data(), 0644); err != nil {
						return fmt.Errorf("failed to write file %s: %w", outFilePath, err)
					}
				}
			}

			outFolder = subDir
			// Append the type as file suffix/extension
			outFileName := "resources.json"
			outFilePath := filepath.Join(outFolder, outFileName)
			rlstJson, err := json.MarshalIndent(rlst, "", "  ")

			if err != nil {
				panic("Error serializing JSON")
			}

			if err := os.WriteFile(outFilePath, rlstJson, 0644); err != nil {
				panic("Error writing resource file")
			}
		}

		if strings.EqualFold(filepath.Ext(d.Name()), ".AV") {
			baseName := strings.TrimSuffix(d.Name(), filepath.Ext(d.Name()))
			subDir := filepath.Join(outputDir, baseName)

			if err := os.MkdirAll(subDir, 0755); err != nil {
				return fmt.Errorf("failed to create subdirectory %s: %w", subDir, err)
			}

			avFile := file.ReadAVFile(path)

			for _, audioFile := range avFile.ExtractAudio() {
				// Append the type as file suffix/extension
				outFileName := fmt.Sprintf("%s.stream", audioFile.Name)
				outFilePath := filepath.Join(subDir, outFileName)

				if err := os.WriteFile(outFilePath, audioFile.RawVagData, 0644); err != nil {
					fmt.Println("NAME BYTES: ", hex.Dump([]byte(audioFile.Name)))
					return fmt.Errorf("failed to write file %s: %w", outFilePath, err)
				}
			}

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
	extractCmd.Flags().BoolP("sub-folders", "s", false, "Create sub-folders for each asset type")
}
