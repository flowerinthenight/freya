package main

import (
	"fmt"
	"os"
	"os/signal"
	"syscall"

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
	go func() {
		s := make(chan os.Signal, 1)
		signal.Notify(s, syscall.SIGINT, syscall.SIGTERM)
		sig := fmt.Errorf("%s", <-s)
		_ = sig
		os.Exit(0)
	}()

	rootCmd.Execute()
}
