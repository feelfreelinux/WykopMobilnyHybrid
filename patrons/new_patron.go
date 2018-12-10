package main

import (
	"context"
	"encoding/json"
	"fmt"
	"net/http"
	"os"

	"github.com/google/go-github/v19/github"
	"golang.org/x/oauth2"
)

type J map[string]interface{}

func writeJSON(w http.ResponseWriter, code int, data interface{}) {
	w.WriteHeader(code)
	serialized, err := json.Marshal(data)
	if err != nil {
		serialized, _ = json.Marshal(err.Error())
	}
	w.Write(serialized)
}

func Handler(w http.ResponseWriter, r *http.Request) {
	ctx := context.Background()
	ts := oauth2.StaticTokenSource(
		&oauth2.Token{AccessToken: os.Getenv("GITHUB_API_KEY")},
	)
	tc := oauth2.NewClient(ctx, ts)

	client := github.NewClient(tc)
	//repo, _, err := client.Repositories.Get(ctx, "otwarty-bot-pullujacy", "WykopMobilnyHybrid")
	// if err != nil {
	// 	fmt.Println("An error has occured when fetching the fork", err.Error())
	// 	writeJSON(w, 500, J{
	// 		"message": "An error has occured when fetching the fork",
	// 	})
	// 	return
	// }
	ref, _, err := client.Git.GetRef(ctx, "feelfreelinux", "WykopMobilnyHybrid", "heads/develop")
	if err != nil {
		fmt.Println("An error has occured when fetching ref", err.Error())
		writeJSON(w, 500, J{
			"message": "An error has occured when fetching ref",
		})
		return
	}
	_, _, err = client.Git.UpdateRef(ctx, "otwarty-bot-pullujacy", "WykopMobilnyHybrid", ref, true)
	if err != nil {
		fmt.Println("An error has occured when updating ref", err.Error())
		writeJSON(w, 500, J{
			"message": "An error has occured when updating ref",
		})
		return
	}
	//client.Repositories()
}
