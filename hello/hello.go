package main

import (
	"fmt"
	"example.com/greetings"
)

func main() {
	message := greetings.Hello("Gladis")
	fmt.Println(message)
}
