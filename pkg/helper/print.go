package helper

import (
	"encoding/json"
	"fmt"
)

func PrintJSON(v any) {
	json, err := json.MarshalIndent(v, "", "  ")
	if err != nil {
		fmt.Println("json marshalIndent error")
		return
	}
	fmt.Println(string(json))
}
