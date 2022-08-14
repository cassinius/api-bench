package main

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"

	"github.com/bytedance/sonic"
	"github.com/gorilla/mux"

	"go-pg-bench/sqlc/tutorial"

	_ "github.com/lib/pq"
)

func run() error {
	ctx := context.Background()

	db, err := sql.Open("postgres", "user=retailer password=retailer dbname=retailer_api sslmode=disable")
	if err != nil {
		return err
	}

	queries := tutorial.New(db)

	// list all retailers
	retailers, err := queries.ListRetailers(ctx)
	if err != nil {
		return err
	}
	log.Println(retailers)

	// get a retailer
	fetchedRetailer, err := queries.GetRetailer(ctx, 42)
	if err != nil {
		return err
	}
	log.Println(fetchedRetailer)

	return nil
}

//
func server() {
	ctx := context.Background()

	// dbPool := pgx.GetDbPool()
	// defer dbPool.Close()

	db, _ := sql.Open("postgres", "user=retailer password=retailer dbname=retailer_api sslmode=disable")
	// if err != nil {
	// 	return err
	// }

	queries := tutorial.New(db)

	getRetailers := func(w http.ResponseWriter, r *http.Request) {
		retailers, _ := queries.ListRetailers(ctx)
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
		id, _ := strconv.Atoi(params["id"])
		retailer, _ := queries.GetRetailer(ctx, int32(id))
		jsonResponse, err := sonic.Marshal(retailer)
		if err != nil {
			return
		}
		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(http.StatusOK)
		_, e := w.Write(jsonResponse)
		if e != nil {
			return
		}
	}

	router := mux.NewRouter()

	router.HandleFunc("/retailers", getRetailers).Methods("GET")
	router.HandleFunc("/retailer/{id}", getRetailer).Methods("GET")

	http.Handle("/", router)

	fmt.Fprintln(os.Stdout, "Listening on port 8000")
	http.ListenAndServe(":8000", router)
}

func main() {
	if err := run(); err != nil {
		log.Fatal(err)
	}

	server()
}
