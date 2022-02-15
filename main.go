package main

import (
	"fmt"

	"github.com/replit/database-go"
)

func main() {
	fmt.Println("welcome")

	database.Set("key", "value")

	value, _ := database.Get("key")
	fmt.Println(value)

	database.Delete("key")

	keys, _ := database.ListKeys("")
	fmt.Println(keys)

	matches, _ := database.ListKeys("prefix")
	fmt.Println(matches)
}
