-- name: GetRetailer :one
SELECT * FROM retailer
WHERE id = ? LIMIT 1;

-- name: ListRetailers :many
SELECT * FROM retailer;
