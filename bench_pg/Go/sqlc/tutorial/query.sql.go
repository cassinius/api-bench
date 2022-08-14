// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.15.0
// source: query.sql

package tutorial

import (
	"context"
)

const getRetailer = `-- name: GetRetailer :one
SELECT id, "GSTIN", "Business_name", "Contact_person", "Contact_number", "Contact_address", "Contact_emailId", "Status", "Outlet_limit" FROM retailer
WHERE id = $1 LIMIT 1
`

func (q *Queries) GetRetailer(ctx context.Context, id int32) (Retailer, error) {
	row := q.db.QueryRowContext(ctx, getRetailer, id)
	var i Retailer
	err := row.Scan(
		&i.ID,
		&i.GSTIN,
		&i.BusinessName,
		&i.ContactPerson,
		&i.ContactNumber,
		&i.ContactAddress,
		&i.ContactEmailId,
		&i.Status,
		&i.OutletLimit,
	)
	return i, err
}

const listRetailers = `-- name: ListRetailers :many
SELECT id, "GSTIN", "Business_name", "Contact_person", "Contact_number", "Contact_address", "Contact_emailId", "Status", "Outlet_limit" FROM retailer
`

func (q *Queries) ListRetailers(ctx context.Context) ([]Retailer, error) {
	rows, err := q.db.QueryContext(ctx, listRetailers)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []Retailer
	for rows.Next() {
		var i Retailer
		if err := rows.Scan(
			&i.ID,
			&i.GSTIN,
			&i.BusinessName,
			&i.ContactPerson,
			&i.ContactNumber,
			&i.ContactAddress,
			&i.ContactEmailId,
			&i.Status,
			&i.OutletLimit,
		); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Close(); err != nil {
		return nil, err
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}
