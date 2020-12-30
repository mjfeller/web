package main

import "net/http"

func main() {
	files := http.FileServer(http.Dir("www/blog/"))
	http.ListenAndServe(":8080", files)
}
