### Ryzen 7 5800H Laptop (test command -> `wrk`)

#### Environment

* Ryzen 7 5800h
* 16 GB Ram
* Arch Linux (Garuda)
* ArangoDb 3.7.10

#### Test command

##### For 100 documents

```bash
wrk -t 8 -c 300 -m PUT http://localhost:8529/_db/retailer/_api/document/retailers?onlyget=true -s query_retailers_wrk.lua
```

##### For a single document

```bash
wrk -t 8 -c 300 http://localhost:8529/_db/retailer/_api/document/retailers/455
```

* HTTP interface, all records => 20444.32
* HTTP interface, single record => 333364.39
