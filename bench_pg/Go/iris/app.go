package main

import (
	"github.com/kataras/iris/v12"
	"github.com/kataras/iris/v12/middleware/logger"
	_ "github.com/kataras/iris/v12/middleware/recover"
	"go-pg-bench/helpers"
	"go-pg-bench/shared/db/pgx"
	"go-pg-bench/shared/models/responses"
)

/**
 *
 */
func main() {
	dbPool := pgx.GetDbPool()
	defer dbPool.Close()

	returnStatusOk := func(ctx iris.Context) {
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
		retailer := pgx.GetRetailer(dbPool, ctx.Params().Get("id"))
		ctx.JSON(retailer)
	}

	app := iris.New()
	//app.Use(recover.New())
	app.Logger().SetLevel(helpers.GetLogLevel())
	app.Use(logger.New())

	app.Get("/", returnStatusOk)
	app.Get("/retailers", getRetailers)
	app.Get("/retailer/:id", getRetailer)

	app.Run(iris.Addr(":8000"))
}
