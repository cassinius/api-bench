package main

import (
	"database/sql"
	"github.com/kataras/iris/v12"
	"github.com/kataras/iris/v12/middleware/logger"
	"github.com/kataras/iris/v12/middleware/recover"
	_ "github.com/lib/pq"
	"log"
)

type ApiResponse struct {
	Status  int16  `json:"status"`
	Message string `json:"msg"`
}

type Retailer struct {
	Id               int32  `json:"id"`
	GSTIN            string `json:"gstin"`
	Business_name    string `json:"business_name"`
	Contact_person   string `json:"contact_person"`
	Contact_number   int32  `json:"contact_number"`
	Constact_address string `json:"contact_address"`
	Contact_emailId  string `json:"contact_emailId"`
	Status           string `json:"status"`
	Outlet_limit     int32  `json:"outlet_limit"`
}

/**
 *
 */
func main() {
	app := iris.New()
	app.Logger().SetLevel("error")
	app.Use(recover.New())
	app.Use(logger.New())

	//var db *sql.DB
	connStr := "postgres://retailer:retailer@localhost:5432/retailer_api?sslmode=disable"
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	app.Get("/", func(ctx iris.Context) {
		//ctx.HTML("Hello World")
		ctx.JSON(ApiResponse{
			Status:  200,
			Message: "Golang Retailer API up and running.",
		})
	})

	app.Get("/retailers", func(ctx iris.Context) {
		var retailers []Retailer
		rows, err := db.Query("SELECT * FROM retailer")
		if err != nil {
			log.Fatal(err)
		}
		for rows.Next() {
			var retailer Retailer
			err := rows.Scan(&retailer.Id, &retailer.GSTIN, &retailer.Business_name, &retailer.Contact_person, &retailer.Contact_number, &retailer.Constact_address, &retailer.Contact_emailId, &retailer.Status, &retailer.Outlet_limit)
			if err != nil {
				log.Fatal(err)
			}
			retailers = append(retailers, retailer)
		}
		ctx.JSON(retailers)
	})

	app.Run(iris.Addr(":8000"))
}
