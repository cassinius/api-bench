package main

import (
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/logger"
	"go-pg-bench/shared/db/pgx"
	"go-pg-bench/shared/models/responses"
	"os"
)

/**
 *
 */
func main() {
	dbPool := pgx.GetDbPool()
	defer dbPool.Close()

	returnStatusOk := func(ctx *fiber.Ctx) error {
		return ctx.JSON(responses.ApiResponse{
			Status:  200,
			Message: "Go->Fiber Retailer API up and running.",
		})
	}

	getRetailers := func(ctx *fiber.Ctx) error {
		retailers := pgx.GetRetailers(dbPool)
		return ctx.JSON(retailers)
	}

	getRetailer := func(ctx *fiber.Ctx) error {
		retailer := pgx.GetRetailer(dbPool, ctx.Params("id"))
		return ctx.JSON(retailer)
	}

	func() {

	}()

	app := fiber.New()
	if os.Getenv("APP_ENV") != "production" {
		app.Use(logger.New())
	}

	app.Get("/", returnStatusOk)
	app.Get("/retailers", getRetailers)
	app.Get("/retailer/:id", getRetailer)

	app.Listen(":8000")
}
