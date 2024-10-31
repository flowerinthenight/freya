package main

import (
	"github.com/spf13/cobra"
)

var (
	rootCmd = &cobra.Command{
		Use:          "thea",
		Short:        "Caching server for Arrow-based data",
		Long:         `Caching server for Arrow-based data.`,
		Run:          run,
		SilenceUsage: true,
	}
)

func run(cmd *cobra.Command, args []string) {
}

func main() {
	rootCmd.Execute()
}
