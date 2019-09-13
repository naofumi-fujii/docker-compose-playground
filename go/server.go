package main

import (
	"fmt"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	log.Printf("%#v", r)
	fmt.Fprintf(w, "Hello, World")
}

func main() {
	http.HandleFunc("/", handler)
	httpPort := 8080
	fmt.Printf("listening on %v\n", httpPort)
	http.ListenAndServe(fmt.Sprintf(":%d", httpPort), nil)
}
