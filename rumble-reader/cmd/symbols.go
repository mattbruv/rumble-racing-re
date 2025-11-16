package cmd

import (
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"

	"github.com/spf13/cobra"
)

var symbolsCmd = &cobra.Command{
	Use:   "symbols",
	Short: "Parse the Feb 7, 2001 symbol map into a file Ghidra can import",
	Long:  `Parse the Feb 7, 2001 symbol map into a file Ghidra can import`,
	RunE: func(cmd *cobra.Command, args []string) error {
		input, _ := cmd.Flags().GetString("input")
		fmt.Println("Hello", input)

		data, err := os.ReadFile(input)
		if err != nil {
			log.Fatalf("failed to read file: %s", err)
		}

		lines := strings.Split(string(data), "\n")

		var outLines []string
		var pcsx2Lines []string

		for _, line := range lines {
			fields := strings.Fields(line)
			if len(fields) >= 4 {
				// Try to parse first field as hex
				if _, err := strconv.ParseUint(fields[0], 16, 64); err != nil {
					continue // not hex, skip
				}

				addr := fields[0]
				sizeHex := fields[1]
				section := fields[2]
				name := fields[3]

				typeChar := "l"
				if section == ".text" {
					typeChar = "f"
				}

				// Only export symbols with sizes > 0
				size, err := strconv.ParseInt(sizeHex, 16, 64)
				if err == nil {
					out := fmt.Sprintf("%s %s %s", name, addr, typeChar)
					ps2 := fmt.Sprintf("%s %s", addr, name)
					if size > 0 {
						outLines = append(outLines, out)
						pcsx2Lines = append(pcsx2Lines, ps2)
					}
				}

			}
		}

		var outData = strings.Join(outLines, "\n")
		var outPs2 = strings.Join(pcsx2Lines, "\n")

		if err := os.WriteFile("./symbols_ghidra.txt", []byte(outData), 0644); err != nil {
			return fmt.Errorf("failed to write symbols file: %w", err)
		}
		if err := os.WriteFile("./symbols_pcsx2.sym", []byte(outPs2), 0644); err != nil {
			return fmt.Errorf("failed to write symbols file: %w", err)
		}

		return nil
	},
}

func init() {
	rootCmd.AddCommand(symbolsCmd)

	// Required flags
	symbolsCmd.Flags().StringP("input", "i", "", "Input file (required)")
	symbolsCmd.MarkFlagRequired("input")
}
