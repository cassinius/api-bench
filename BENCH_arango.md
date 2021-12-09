## Ryzen 7 5800H Laptop (test command -> `wrk`)

### Environment

* Ryzen 7 5800h
* 16 GB Ram
* Arch Linux (Garuda)
* ArangoDb 3.7.10

### Test command

#### For <x> documents

```bash
wrk -t 8 -c 300 -m PUT http://localhost:8529/_db/retailer/_api/document/retailers?onlyget=true -s query_retailers_wrk.lua
```

#### For a single document

```bash
wrk -t 8 -c 300 http://localhost:8529/_db/retailer/_api/document/retailers/455
```

### Results, built-in HTTP server

* HTTP interface, single record => 333364.39
* HTTP interface,  10 records => 144251.76
* HTTP interface,  30 records => 56000.56
* HTTP interface, 100 records => 20444.32

