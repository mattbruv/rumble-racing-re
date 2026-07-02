package cmd

import (
	"fmt"
	"os"
	"rumble-reader/asset/track"

	"github.com/spf13/cobra"
)

var trackCmd = &cobra.Command{
	Use:   "track",
	Short: "Test Track parse",
	Long:  `test Track parsing`,
	RunE: func(cmd *cobra.Command, args []string) error {

		data, err := os.ReadFile("../coalCuts.gmd")

		if err != nil {
			panic("unable to open file")
		}

		track, err := track.ParseTrackData(data)

		fmt.Println(len(track.RawData()))

		if err != nil {
			panic(err)
		}

		return nil
	},
}

func init() {
	rootCmd.AddCommand(trackCmd)
}
