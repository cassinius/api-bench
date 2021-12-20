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

* single record => 333364.39
*  10 records => 144251.76
*  30 records => 56000.56
* 100 records => 20444.32

### Results .NET Core 6 Min API + dotnet-arangodb (Core.Arango) client

* single record by FUNC => 81583.92
* single record by QUERY => 42914.86

#### Multiple Records: AQL + LIMIT

*  10 records => 37791.61
*  30 records => 27207.12
* 100 records => 13710.76

#### Multiple Records by Array of IDs

