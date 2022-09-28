package main

import (
	"context"
	"fmt"
	"log"
	"retent/ent"

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

	c, _ := client.Retailer.Query().Count(ctx)
	//rs, err := client.Retailer.Query().All(ctx)
	//r, _ := client.Retailer.Query().Where(retailer.ID(42)).First(ctx) // .Only(ctx) //.Get(ctx, 42)
	r, _ := client.Retailer.Get(ctx, 42)

	fmt.Println(fmt.Sprintf("Retailers count: %d", c))
	//fmt.Println(rs)
	fmt.Println(r)
}
