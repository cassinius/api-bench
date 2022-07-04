package main

import (
	"fmt"
	"github.com/bytedance/sonic"
	"github.com/goccy/go-json"
	"github.com/gorilla/mux"
	model "go-pg-bench/shared/models"
	"go-pg-bench/shared/models/responses"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"gorm.io/gorm/schema"
	"log"
	"net/http"
	"os"
)

/**
 *
 */
func main() {
	dsn := "host=localhost user=retailer password=retailer dbname=retailer_api port=5432 sslmode=disable"
	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{
		NamingStrategy: schema.NamingStrategy{
			SingularTable: true,
			NoLowerCase:   false,
		},
	})
	if err != nil {
		log.Fatalf("failed to connect database: %v", err)
	}
	dbPool, err := db.DB()
	dbPool.SetMaxIdleConns(10)
	dbPool.SetMaxOpenConns(50)

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
		var retailers []model.Retailer
		db.Find(&retailers).Limit(100)
		//retailers := pgx.GetRetailers(dbPool)
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
		var retailer model.Retailer
		db.First(&retailer, id)
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

	router.HandleFunc("/", returnStatus).Methods("GET")
	router.HandleFunc("/retailers", getRetailers).Methods("GET")
	router.HandleFunc("/retailer/{id}", getRetailer).Methods("GET")

	http.Handle("/", router)

	fmt.Fprintln(os.Stdout, "Listening on port 8000")
	http.ListenAndServe(":8000", router)
}
