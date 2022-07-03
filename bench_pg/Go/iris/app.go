package main

import (
	"github.com/kataras/iris/v12"
	"github.com/kataras/iris/v12/middleware/logger"
	_ "github.com/kataras/iris/v12/middleware/recover"
	"go-pg-bench/_shared/db/pgx"
	"go-pg-bench/_shared/helpers"
	"go-pg-bench/_shared/models/responses"
)

/**
 *
 */
func main() {
	dbPool := pgx.GetDbPool()
	defer dbPool.Close()

	returnStatus := func(ctx iris.Context) {
		ctx.JSON(responses.ApiResponse{
			Status:  200,
			Message: "Go->Fiber Retailer API up and running.",
		})
	}

	getRetailers := func(ctx iris.Context) {
		retailers := pgx.GetRetailers(dbPool)
		ctx.JSON(retailers)
	}

	getRetailer := func(ctx iris.Context) {
		id := ctx.Params().Get("id")
		retailer := pgx.GetRetailer(dbPool, id)
		ctx.JSON(retailer)
	}

	app := iris.New()
	//app.Use(recover.New())
	app.Logger().SetLevel(helpers.GetLogLevel())
	app.Use(logger.New())

	app.Get("/", returnStatus)
	app.Get("/retailers", getRetailers)
	app.Get("/retailer/{id:uint64}", getRetailer)

	config := iris.WithConfiguration(iris.Configuration{
		DisableStartupLog:   false,
		EnableOptimizations: true,
		Charset:             "UTF-8",
	})

	app.Listen(":8000", config)
}
