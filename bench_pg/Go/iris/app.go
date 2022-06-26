package main

import (
	"context"
	"github.com/jackc/pgx/v4/pgxpool"
	"github.com/kataras/iris/v12"
	"github.com/kataras/iris/v12/middleware/logger"
	"github.com/kataras/iris/v12/middleware/recover"
	"log"
)

type ApiResponse struct {
	Status  int16  `json:"status"`
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
	app := iris.New()
	app.Logger().SetLevel("error")
	app.Use(recover.New())
	app.Use(logger.New())

	connStr := "user=retailer password=retailer dbname=retailer_api sslmode=disable"

	dbPool, err := pgxpool.Connect(context.Background(), connStr)
	//dbPool, err := sql.Open("postgres", connStr)

	if err != nil {
		log.Fatal(err)
	}
	defer dbPool.Close()

	app.Get("/", func(ctx iris.Context) {
		ctx.JSON(ApiResponse{
			Status:  200,
			Message: "Golang Retailer API up and running.",
		})
	})

	app.Get("/retailers", func(ctx iris.Context) {
		var retailers []Retailer
		rows, err := dbPool.Query(context.Background(), "SELECT * FROM retailer")
		if err != nil {
			log.Fatal(err)
		}
		for rows.Next() {
			var retailer Retailer
			err := rows.Scan(&retailer.Id, &retailer.GSTIN, &retailer.Business_name, &retailer.Contact_person, &retailer.Contact_number, &retailer.Constact_address, &retailer.Contact_emailId, &retailer.Status, &retailer.Outlet_limit)
			if err != nil {
				log.Fatal(err)
			}
			retailers = append(retailers, retailer)
		}
		ctx.JSON(retailers)
	})

	app.Get("/retailer/{id}", func(ctx iris.Context) {
		id := ctx.Params().Get("id")
		var retailer Retailer
		row := dbPool.QueryRow(context.Background(), "SELECT * FROM retailer WHERE id = $1", id)
		err := row.Scan(&retailer.Id, &retailer.GSTIN, &retailer.Business_name, &retailer.Contact_person, &retailer.Contact_number, &retailer.Constact_address, &retailer.Contact_emailId, &retailer.Status, &retailer.Outlet_limit)
		if err != nil {
			log.Fatal(err)
		}
		ctx.JSON(retailer)
	})

	app.Run(iris.Addr(":8000"))
}
