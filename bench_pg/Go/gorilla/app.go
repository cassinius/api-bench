package main

import (
	"fmt"
	"github.com/gorilla/mux"
	"github.com/pquerna/ffjson/ffjson"
	"go-pg-bench/shared/db/pgx"
	"go-pg-bench/shared/models/responses"
	"net/http"
	"os"
)

/**
 *
 */
func main() {
	dbPool := pgx.GetDbPool()
	defer dbPool.Close()

	returnStatus := func(w http.ResponseWriter, r *http.Request) {
		jsonResponse, err := ffjson.Marshal(responses.ApiResponse{
			Status:  200,
			Message: "Go->Gorilla/Mux Retailer API up and running.",
		})
		if err != nil {
			return
		}
		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(http.StatusOK)
		w.Write(jsonResponse)
	}

	getRetailers := func(w http.ResponseWriter, r *http.Request) {
		retailers := pgx.GetRetailers(dbPool)
		jsonResponse, err := ffjson.Marshal(&retailers)
		if err != nil {
			return
		}
		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(http.StatusOK)
		w.Write(jsonResponse)
	}

	getRetailer := func(w http.ResponseWriter, r *http.Request) {
		params := mux.Vars(r)
		id := params["id"]
		retailers := pgx.GetRetailer(dbPool, id)
		jsonResponse, err := ffjson.Marshal(retailers)
		if err != nil {
			return
		}
		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(http.StatusOK)
		w.Write(jsonResponse)
	}

	router := mux.NewRouter()

	router.HandleFunc("/", returnStatus).Methods("GET")
	router.HandleFunc("/retailers", getRetailers).Methods("GET")
	router.HandleFunc("/retailer/{id}", getRetailer).Methods("GET")

	http.Handle("/", router)

	fmt.Fprintln(os.Stdout, "Listening on port 8000")
	http.ListenAndServe(":8000", router)
}
