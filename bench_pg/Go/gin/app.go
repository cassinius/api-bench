package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"go-pg-bench/_shared/db/pgx"
)

/**
 *
 */
func main() {
	dbPool := pgx.GetDbPool()
	defer dbPool.Close()

	returnStatus := func(ctx *gin.Context) {
		ctx.JSON(200, gin.H{
			"status":  200,
			"message": "Go->Gin Retailer API up and running.",
		})
	}

	getRetailers := func(ctx *gin.Context) {
		retailers := pgx.GetRetailers(dbPool)
		ctx.JSON(200, retailers)
	}

	getRetailer := func(c *gin.Context) {
		id := c.Param("id")
		retailer := pgx.GetRetailer(dbPool, id)
		c.JSON(200, retailer)
	}

	r := gin.New()

	r.GET("/", returnStatus)
	r.GET("/retailers", getRetailers)
	r.GET("/retailer/:id", getRetailer)

	fmt.Println("Go->Gin Retailer API starting on port 8000.")
	r.Run(":8000")
}
