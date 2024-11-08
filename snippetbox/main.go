package main

import (
	"log"
	"net/http"
)

// Define a home handler function which writes a byte slice containing "Hello from Snippetbox" as the response body.
func home(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello from Snippetbox"))
}

func main() {
	// Use the http.NewServeMux() function to initialize a new servemux, then register the home function as a handler for the "/" URL pattern
	mux := http.NewServeMux()
	mux.HandleFunc("/", home)

	log.Print("starting server on :4000")

	err := http.ListenAndServe(":4000", mux)
	log.Fatal(err)
}
