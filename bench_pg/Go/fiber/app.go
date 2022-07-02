package main

import (
	"context"
	"github.com/gofiber/fiber/v2"
	"github.com/jackc/pgx/v4/pgxpool"
	"go-pg-bench/shared/models"
	"go-pg-bench/shared/models/responses"
	"log"
)

/**
 *
 */
func main() {
	connStr := "user=retailer password=retailer dbname=retailer_api sslmode=disable statement_cache_capacity=10"

	dbPool, err := pgxpool.Connect(context.Background(), connStr)

	if err != nil {
		log.Fatal(err)
	}
	defer dbPool.Close()

	app := fiber.New()

	app.Get("/", func(ctx *fiber.Ctx) error {
		return ctx.JSON(responses.ApiResponse{
			Status:  200,
			Message: "Go->Fiber Retailer API up and running.",
		})
	})

	app.Get("/retailers", func(ctx *fiber.Ctx) error {
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
		return ctx.JSON(retailers)
	})

	app.Get("/retailer/:id", func(ctx *fiber.Ctx) error {
		id := ctx.Params("id")
		var retailer model.Retailer
		row := dbPool.QueryRow(context.Background(), "SELECT * FROM retailer WHERE id = $1", id)
		err := row.Scan(&retailer.Id, &retailer.GSTIN, &retailer.Business_name, &retailer.Contact_person, &retailer.Contact_number, &retailer.Constact_address, &retailer.Contact_emailId, &retailer.Status, &retailer.Outlet_limit)
		if err != nil {
			log.Fatal(err)
		}
		return ctx.JSON(retailer)
	})

	app.Listen(":8000")
}
