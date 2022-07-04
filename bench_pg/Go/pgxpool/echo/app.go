package main

import (
	"github.com/labstack/echo/v4"
	"go-pg-bench/shared/db/pgx"
	"go-pg-bench/shared/models/responses"
	"net/http"
)

func main() {
	dbPool := pgx.GetDbPool()
	defer dbPool.Close()

	returnStatus := func(c echo.Context) error {
		return c.JSON(http.StatusOK, responses.ApiResponse{
			Status:  200,
			Message: "Go->Echo Retailer API up and running.",
		})
	}

	getRetailers := func(c echo.Context) error {
		retailers := pgx.GetRetailers(dbPool)
		return c.JSON(http.StatusOK, retailers)
	}

	getRetailer := func(c echo.Context) error {
		id := c.Param("id")
		retailer := pgx.GetRetailer(dbPool, id)
		return c.JSON(http.StatusOK, retailer)
	}

	e := echo.New()

	e.GET("/", returnStatus)
	e.GET("/retailers", getRetailers)
	e.GET("/retailer/:id", getRetailer)

	e.Logger.Fatal(e.Start(":8000"))
}
