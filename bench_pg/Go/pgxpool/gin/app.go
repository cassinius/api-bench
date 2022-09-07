package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"go-pg-bench/shared/db/pgx"
	"net/http"
)

/**
 *
 */
func main() {
	dbPool := pgx.GetDbPool()
	defer dbPool.Close()

	returnStatus := func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"status":  "Ok",
			"message": "Go->Gin Retailer API up and running.",
		})
	}

	getRetailers := func(c *gin.Context) {
		retailers := pgx.GetRetailers(dbPool)
		c.JSON(http.StatusOK, retailers)
	}

	getRetailer := func(c *gin.Context) {
		id := c.Param("id")
		retailer := pgx.GetRetailer(dbPool, id)
		c.JSON(http.StatusOK, retailer)
	}

	g := gin.New()

	g.GET("/", returnStatus)
	g.GET("/retailers", getRetailers)
	g.GET("/retailer/:id", getRetailer)

	fmt.Println("Go->Gin Retailer API starting on port 8000.")
	g.Run(":8000")
}
