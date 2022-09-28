package main

import (
	"context"
	"time"

	"entgo.io/ent/dialect/sql"

	"fmt"
	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
	"log"
	"net/http"
	"retent/ent"
	"strconv"
)

const dsn = "host=localhost port=5432 user=retailer dbname=retailer_api password=retailer sslmode=disable"

// Open new connection
func Open() *ent.Client {
	drv, err := sql.Open("postgres", dsn)
	if err != nil {
		log.Fatal(err)
	}

	db := drv.DB()
	db.SetMaxIdleConns(10)
	db.SetMaxOpenConns(50)
	db.SetConnMaxLifetime(time.Minute)

	return ent.NewClient(ent.Driver(drv))
}

func main() {
	ctx := context.Background()

	//drv, err := sql.Open("postgres", dsn)
	//if err != nil {
	//	log.Fatalf("failed opening connection to postgres: %v", err)
	//}

	client := Open()
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
	r, _ := client.Retailer.Get(ctx, 42)
	//rs, err := client.Retailer.Query().All(ctx)
	//r, _ := client.Retailer.Query().Where(retailer.ID(42)).First(ctx) // .Only(ctx) //.Get(ctx, 42)

	fmt.Println(fmt.Sprintf("Retailers count: %d", c))
	fmt.Println(r)
	//fmt.Println(rs)

	fmt.Println("Go->Gin Retailer API starting on port 8000.")
	g.Run(":8000")
}
