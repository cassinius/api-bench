package main

import (
	"fmt"
	"github.com/bytedance/sonic"
	"github.com/goccy/go-json"
	"github.com/gorilla/mux"
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

	// About the same speed as the standard library's json.Marshal().
	//var json = jsoniter.ConfigFastest

	returnStatus := func(w http.ResponseWriter, r *http.Request) {
		jsonResponse, err := json.Marshal(responses.ApiResponse{
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
		jsonResponse, err := sonic.Marshal(retailers)
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
		retailer := pgx.GetRetailer(dbPool, id)
		jsonResponse, err := sonic.Marshal(retailer)
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
