-- name: GetRetailer :one
SELECT * FROM retailer
WHERE id = $1 LIMIT 1;

-- name: ListRetailers :many
SELECT * FROM retailer;
