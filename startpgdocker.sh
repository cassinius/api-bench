#!/bin/bash

docker run -d \
	--name postgresql14bench \
	-p 5432:5432 \
	-v ~/pg14/data/retailer \
	-e POSTGRES_PASSWORD=retailer \
	-e POSTGRES_USER=retailer \
	-e POSTGRES_DB=retailer_api \
	postgres:14-alpine

