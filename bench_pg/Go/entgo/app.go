package main

import (
	"context"
	"fmt"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
	"retent/ent"
	"strconv"

	_ "github.com/lib/pq"
)

func main() {
	ctx := context.Background()

	// TODO: configure ent with pgxpool
	client, err := ent.Open("postgres", "host=localhost port=5432 user=retailer dbname=retailer_api password=retailer sslmode=disable")
	if err != nil {
		log.Fatalf("failed opening connection to postgres: %v", err)
	}
	defer client.Close()

	// Run the auto migration tool.
	//if err := client.Schema.Create(context.Background()); err != nil {
	//	log.Fatalf("failed creating schema resources: %v", err)
	//}

	returnStatus := func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"status":  "Ok",
			"message": "Go->Gin Retailer API up and running.",
		})
	}

	getRetailers := func(c *gin.Context) {
		retailers, _ := client.Retailer.Query().All(c)
		c.JSON(http.StatusOK, retailers)
	}

	getRetailer := func(c *gin.Context) {
		idStr := c.Param("id")
		id, _ := strconv.Atoi(idStr)
		retailer, _ := client.Retailer.Get(c, id)
		c.JSON(http.StatusOK, retailer)
	}

	g := gin.New()

	g.GET("/", returnStatus)
	g.GET("/retailers", getRetailers)
	g.GET("/retailer/:id", getRetailer)

	c, _ := client.Retailer.Query().Count(ctx)
	//rs, err := client.Retailer.Query().All(ctx)
	//r, _ := client.Retailer.Query().Where(retailer.ID(42)).First(ctx) // .Only(ctx) //.Get(ctx, 42)
	r, _ := client.Retailer.Get(ctx, 42)

	fmt.Println(fmt.Sprintf("Retailers count: %d", c))
	//fmt.Println(rs)
	fmt.Println(r)

	fmt.Println("Go->Gin Retailer API starting on port 8000.")
	g.Run(":8000")
}
