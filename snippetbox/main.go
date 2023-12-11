package main

import (
	"log"
	"net/http"
)

// Define a home handler function which writes a byte clise containing
// "Hello from Snippetbox" as the response body
func home(w http.ResponseWriter, r *http.Request) {
	// Check if the current request URL path exactly matches "/". If it doesn't use
	// the http.NotFound() function to send a 404 response to the client
	// Importantly, we then return from the handler. If we don't return the handler
	// would keep executing and also write the "Hello from snippetbox" message
	if r.URL.Path != "/" {
		http.NotFound(w, r)
		return
	}
	w.Write([]byte("Hello from Snippetbox"))
}

// Add a snippetView handler function
func snippetView(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Display a specific snippet..."))
}

// Add a snippetCreate handler function
func snippetCreate(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Create a new Snippet..."))
}

func main() {
	// Use the http.NewServeMux() funciton to initialize a new servemux, then
	// register the home function as a handler for the "/" URL pattern
	mux := http.NewServeMux()
	mux.HandleFunc("/", home)
	mux.HandleFunc("/snippet/view", snippetView)
	mux.HandleFunc("/snippet/create", snippetCreate)

	// Print a log message to say that the server is starting
	log.Print("Starting server on :4000")

	// Use the http.ListenAnServe() function to start new web server. We pass in
	// two parameters: the TCP network address to listen to (":4000")
	// and the servemux we just created. If http.ListenandServe() returns an error
	// we use the log.fatal() function to log the error message and exit.
	// NOTE: that any error returned by http.ListenAndServe() is always non-nil
	err := http.ListenAndServe(":4000", mux)
	log.Fatal(err)
}