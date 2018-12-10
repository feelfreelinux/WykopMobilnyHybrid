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
	if r.Method != "POST" {
		writeJSON(w, 400, J{
			"message": "This request must be a POST",
		})
		return
	}
	ctx := context.Background()
	ts := oauth2.StaticTokenSource(
		&oauth2.Token{AccessToken: os.Getenv("GITHUB_API_KEY")},
	)
	tc := oauth2.NewClient(ctx, ts)

	client := github.NewClient(tc)
	// forkRepo, _, err := client.Repositories.Get(ctx, "otwarty-bot-pullujacy", "WykopMobilnyHybrid")
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

	fileContent, _, _, err := client.Repositories.GetContents(ctx, "otwarty-bot-pullujacy", "WykopMobilnyHybrid", "patrons/patrons.json", &github.RepositoryContentGetOptions{
		Ref: "develop",
	})

	if err != nil {
		fmt.Println("An error has occured fetching patrons.json contents", err.Error())
		writeJSON(w, 500, J{
			"message": "An error has occured fetching patrons.json contents",
		})
		return
	}
	jsonData, err := fileContent.GetContent()
	if err != nil {
		panic(err)
	}
	patrons := J{}
	err = json.Unmarshal([]byte(jsonData), &patrons)
	if err != nil {
		fmt.Println("Failed to parse patrons.json", err.Error())
		writeJSON(w, 500, J{
			"message": "Failed to parse patrons.json",
		})
		return
	}

	patrons["patrons"] = append(patrons["patrons"].([]J), J{
		"username": "rnickson",
		"color":    "magenta",
		"tier":     "socjalizm krul",
		"badge":    "lewak",
	})

	writeJSON(w, 200, J{
		"message": "Success!",
		"data":    patrons,
	})
	//client.Repositories()
}
