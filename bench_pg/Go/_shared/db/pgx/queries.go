package pgx

import (
	"context"
	"github.com/jackc/pgx/v4/pgxpool"
	model "go-pg-bench/_shared/models"
	"log"
)

func GetRetailers(dbPool *pgxpool.Pool) []model.Retailer {
	var retailers []model.Retailer
	rows, err := dbPool.Query(context.Background(), "SELECT * FROM retailer")
	if err != nil {
		log.Fatal(err)
	}
	for rows.Next() {
		var retailer model.Retailer
		err := rows.Scan(&retailer.Id, &retailer.GSTIN, &retailer.Business_name, &retailer.Contact_person, &retailer.Contact_number, &retailer.Constact_address, &retailer.Contact_emailId, &retailer.Status, &retailer.Outlet_limit)
		if err != nil {
			log.Fatal(err)
		}
		retailers = append(retailers, retailer)
	}
	return retailers
}

func GetRetailer(dbPool *pgxpool.Pool, id string) model.Retailer {
	var retailer model.Retailer
	row := dbPool.QueryRow(context.Background(), "SELECT * FROM retailer WHERE id = $1", id)
	err := row.Scan(&retailer.Id, &retailer.GSTIN, &retailer.Business_name, &retailer.Contact_person, &retailer.Contact_number, &retailer.Constact_address, &retailer.Contact_emailId, &retailer.Status, &retailer.Outlet_limit)
	if err != nil {
		log.Fatal(err)
	}
	return retailer
}
