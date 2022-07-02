package main

import (
	"context"
	"github.com/jackc/pgx/v4/pgxpool"
	"github.com/kataras/iris/v12"
	_ "github.com/kataras/iris/v12/middleware/recover"
	"go-pg-bench/shared/models"
	"go-pg-bench/shared/models/responses"
	"log"
)

/**
 *
 */
func main() {
	app := iris.New()
	//app.Logger().SetLevel("error")
	//app.Use(recover.New())
	//app.Use(logger.New())

	connStr := "user=retailer password=retailer dbname=retailer_api sslmode=disable statement_cache_capacity=10"

	dbPool, err := pgxpool.Connect(context.Background(), connStr)
	//dbPool, err := sql.Open("postgres", connStr)

	if err != nil {
		log.Fatal(err)
	}
	defer dbPool.Close()

	app.Get("/", func(ctx iris.Context) {
		ctx.JSON(responses.ApiResponse{
			Status:  200,
			Message: "Go->Iris Retailer API up and running.",
		})
	})

	app.Get("/retailers", func(ctx iris.Context) {
		var retailers []model.Retailer
		rows, err := dbPool.Query(context.Background(), "SELECT * FROM retailer")
		if err != nil {
			log.Fatal(err)
		}
		for rows.Next() {
			var retailer model.Retailer
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
		var retailer model.Retailer
		row := dbPool.QueryRow(context.Background(), "SELECT * FROM retailer WHERE id = $1", id)
		err := row.Scan(&retailer.Id, &retailer.GSTIN, &retailer.Business_name, &retailer.Contact_person, &retailer.Contact_number, &retailer.Constact_address, &retailer.Contact_emailId, &retailer.Status, &retailer.Outlet_limit)
		if err != nil {
			log.Fatal(err)
		}
		ctx.JSON(retailer)
	})

	app.Run(iris.Addr(":8000"))
}
