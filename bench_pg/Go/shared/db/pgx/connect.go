package pgx

import (
	"context"
	"github.com/jackc/pgx/v4/pgxpool"
	"log"
)

const connStr = "user=retailer password=retailer dbname=retailer_api sslmode=disable statement_cache_capacity=10"

// GetDbPool returns a *pgxpool.Pool
/**
 * Haha, only functions that start with a CAPITAL letter are exported.
 */
func GetDbPool() *pgxpool.Pool {
	dbPool, err := pgxpool.Connect(context.Background(), connStr)

	if err != nil {
		log.Fatal(err)
	}

	return dbPool
}
