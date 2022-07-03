package main

import (
	"context"
	"fmt"
	"github.com/arangodb/go-driver"
	"github.com/arangodb/go-driver/http"
	"github.com/kataras/iris/v12"
	"github.com/kataras/iris/v12/middleware/logger"
	"log"
)

type ApiResponse struct {
	Status  uint16 `json:"status"`
	Message string `json:"msg"`
}

type Retailer struct {
	Id               int32  `json:"id"`
	GSTIN            string `json:"gstin"`
	Business_name    string `json:"business_name"`
	Contact_person   string `json:"contact_person"`
	Contact_number   int32  `json:"contact_number"`
	Constact_address string `json:"contact_address"`
	Contact_emailId  string `json:"contact_emailId"`
	Status           string `json:"status"`
	Outlet_limit     int32  `json:"outlet_limit"`
}

/**
 *
 */
func main() {
	conn, err := http.NewConnection(http.ConnectionConfig{
		Endpoints: []string{"http://localhost:8529"},
	})
	if err != nil {
		log.Fatalf("Failed to create connection: %v", err)
	}
	client, err := driver.NewClient(driver.ClientConfig{
		Connection:     conn,
		Authentication: driver.BasicAuthentication("retailer", "retailer"),
	})
	if err != nil {
		log.Fatalf("Failed to create ArangoDB client: %v", err)
	}
	db, err := client.Database(nil, "retailer_api")
	if err != nil {
		log.Fatalf("Failed to open database: %v", err)
	}
	col, err := db.Collection(nil, "retailer")
	if err != nil {
		log.Fatalf("Failed to open collection: %v", err)
	}

	returnStatus := func(ctx iris.Context) {
		ctx.JSON(ApiResponse{
			Status:  200,
			Message: "Go->Iris->ArangoDB Retailer API up and running.",
		})
	}

	getRetailer := func(ctx iris.Context) {
		var retailer Retailer
		id := ctx.Params().Get("id")
		revCtx := driver.WithRevision(context.Background(), "mySpecificRevision")
		_, err := col.ReadDocument(revCtx, id, &retailer)
		if err != nil {
			fmt.Printf("Failed to read document with given id: %s", id)
			return
		}

		ctx.JSON(retailer)
	}

	getRetailers := func(c iris.Context) {
		ctx := context.Background()
		query := "FOR r IN retailer RETURN r"
		retailers := map[string]interface{}{}
		cursor, err := db.Query(ctx, query, retailers)
		if err != nil {
			fmt.Printf("Failed to execute query: %s", query)
			return
		}
		defer cursor.Close()

		c.JSON(retailers)

	}

	app := iris.New()
	//app.Use(recover.New())
	app.Logger().SetLevel("debug")
	app.Use(logger.New())

	app.Get("/", returnStatus)
	app.Get("/retailers", getRetailers)
	app.Get("/retailer/:id", getRetailer)

	config := iris.WithConfiguration(iris.Configuration{
		DisableStartupLog:   false,
		EnableOptimizations: true,
		Charset:             "UTF-8",
	})

	app.Listen(":8000", config)
}
