package main

import (
	"log"

	"github.com/spf13/cobra"
)

var (
	rootCmd = &cobra.Command{
		Use:          "thea",
		Short:        "A simple port-forward wrapper tool for multiple pods/deployments/services",
		Long:         `A simple port-forward wrapper tool for multiple pods/deployments/services.`,
		Run:          run,
		SilenceUsage: true,
	}
)

func run(cmd *cobra.Command, args []string) {
}

func main() {
	log.Println("hello")
}
