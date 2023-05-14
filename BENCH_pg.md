## Performance benchmarks

### Linux server

#### Command

```bash
ab -n 100000 -k -c 16 http://localhost:8000/<path/to/action>
```

#### Environment

- Hetzner server, core i7 quad
- OS: Arch linux
- Kernel: 5.5.4-arch1-1
- Postgres 12.2
- Python 3.7.4
- Python runner: gunicorn
- Node (JS) 13.12
- es4x (JS)
- Rust 1.44 nightly
- default = 16 workers, except when `auto` (pg-pool)

#### Results

##### _all_ ->> `/retailers`

- Py / Falcon / gunicorn => 1103.43 [#/sec](mean)
- Py / Flask / gunicorn => 5823.22 [#/sec](mean)
- Node / express / pg-pool => 1947.65 [#/sec](mean)
- Rust / rocket / diesel => 10756.12 [#/sec](mean)

##### _show_ ->> `/retailer/42`

- Py / Falcon / gunicorn => 2824.16 [#/sec](mean)
- Py / Flask / gunicorn => 8475.40 [#/sec](mean)
- Node / express / pg-pool => 7613.39 [#/sec](mean)
- Rust / rocket / diesel => 22200.08 [#/sec](mean)

---

### Arch Linux Laptop

#### Command

```bash
ab -n 100000 -k -c 8 http://localhost:8000/<path/to/action>
```

#### Results (best out of 3)

##### JSON response static

Node / express => 10219.17 [#/sec] (mean)
Node / vanilla => 15840.53 [#/sec] (mean)
Es4x / vertx => 22101.24 [#/sec] (mean)
Rust / rocket => 21187.22 [#/sec] (mean)
Rust / actix => 18911.75 [#/sec] (mean)

##### _all_ ->> `/retailers`

- Py / falcon / gunicorn => 431.51 [#/sec](mean)
- Py / flask / gunicorn => 2070.50 [#/sec](mean)
- Node / express / pg-pool => 1549.49 [#/sec](mean)
- Node / restify / pg-pool => 1766.46 [#/sec](mean)
- Rust / rocket / diesel => 4782.41 [#/sec](mean)
- Rust / actix / r2d2 (pg) => 4642.40 [#/sec] (mean)

##### _show_ ->> `/retailer/42`

- Py / falcon / gunicorn => 1060.58 [#/sec](mean)
- Py / flask / gunicorn => 2791.79 [#/sec](mean)
- Node / express / pg-pool => 5584.54 [#/sec](mean)
- Node / restify / pg-pool => 5166.64 [#/sec](mean)
- Rust / rocket / diesel => 11317.34 [#/sec](mean)
- Rust / actix / r2d2 (pg) => 12496.74 [#/sec] (mean)

---

### Windows client

#### Command

```bash
ab -n 10000 -k -c 8 http://localhost:8000/<path/to/action>
```

#### Environment

- Thinkpad X1 Carbon 5th gen (2017)
- core i7 due core low power...
- Windows 10
- Postgres 11.5
- Python 3.7.6
- Python runner: waitress
- Node (JS) 13.12
- Rust 1.44 nightly
- default = 16 workers, except when `auto` (pg-pool)

#### Comments / Errors

- Flask on Windows infrequently raises the following error while load testing (not while manually fetching):

```python
retailer = cursor.fetchall()
psycopg2.ProgrammingError: no results to fetch
```

#### Results (best out of 3)

##### _all_ ->> `/retailers`

- Py / Falcon / gunicorn => 160.56 [#/sec](mean)
- Py / Flask / gunicorn => 790.10 [#/sec](mean)
- Node / vanilla / pg-pool => 1011.91 [#/sec](mean)
- Node / express / pg-pool => 1087.38 [#/sec](mean)
- Node / fastify / pg => 863.33 [#/sec](mean)
- Node / restify / pg-pool => 941.78 [#/sec](mean)
- Rust / rocket / diesel => 1496.27 [#/sec](mean)

##### _show_ ->> `/retailer/42`

- Py / Falcon / gunicorn => 474.28 [#/sec](mean)
- Py / Flask / gunicorn => 990.77 [#/sec](mean)
- Node / vanilla / pg-pool => 2197.23 [#/sec](mean)
- Node / express / pg-pool => 3873.78 [#/sec](mean)
- Node / fastify / pg => 2205.89 [#/sec](mean)
- Node / restify / pg-pool => 1979.22 [#/sec](mean)
- Rust / rocket / diesel => 3147.69 [#/sec](mean)

---

### Ryzen 3950 workstation

#### Environment

* Ryzen 3950 16 core, 32 threads
* 128 GB Ram
* Ubuntu 20.04 LTS
* Python 3.7.9
* Node (JS) 14.10.1
* rustc 1.44.0-nightly (dbf8b6bf1 2020-04-19)


#### Results (c=16) (best out of 3) 

> only those that worked with 16 cores & were comparatively fast

###### _all_ ->> `/retailers`

- Py / Flask / gunicorn => 13617.95 [#/sec] (mean)
- Node / express / pg-pool => 11814.09 [#/sec] (mean)
- Node / fastify / fastify-pg => 11911.98 [#/sec] (mean)
- Node / restify / pg-pool => 13958.26 [#/sec] (mean)
- Rust / rocket / diesel => 21276.88 [#/sec] (mean)

###### _show_ ->> `/retailer/42`

- Py / Flask / gunicorn => 18843.98 [#/sec] (mean)
- Node / express / pg-pool => 18547.51 [#/sec] (mean)
- Node / fastify / fastify-pg => 23285.87 [#/sec] (mean)
- Node / restify / pg-pool => 22740.42 [#/sec] (mean)
- Rust / rocket / diesel => 35293.35 [#/sec] (mean)

---

### Intel 10th-gen core i7-10700k (different test command - `wrk`)

#### Environment

* Intel 10th-gen core i7-10700
* 64 GB Ram
* Arch Linux
* Python 3.7.9
* Node (JS) 15.3.0
* rustc 1.44.0-nightly (dbf8b6bf1 2020-04-20)

#### Test command

```bash
wrk -t 16 -c 200 <URL>
```

#### Results

> only those that worked with 16 cores & were comparatively fast

###### _all_ ->> `/retailers`

- Node.js / pg pool / pm2 => 18365.49
- Polka / pg pool / pm2 => 18100.57
- Express / pm2 => 22823.05
- Fastify / fastify-pg / pm2 => 12974.40
- Nanoexpress / pm2 => 14737.24
- Nestjs / fastify / prisma => 2852.65 (JfMJ)
- Py / Flask / gunicorn => 14369.12
- Rust / rocket / diesel => 28293.74
- Rust / actix / diesel => 28349.99
- Rust / warp / tokio_pg => 17798.43

###### _all_ ->> `/Retailer[A?]Sync`

- .NET c5 / EF => 11961.10
- .NET c5 / dapper (sync) => 18086.94
- .NET c5 / dapper (sync, stored proc.) => 16461.93
- .NET c5 / dapper (sync, MessagePack bytes) => 19610.43
- .NET c5 / dapper (sync, Utf8Json) => 18913.00
- .NET c5 / dapper (Async, 100 conns) => 18130.60
- .NET c5 / dapper (Async, Utf8Json) => 18323.76
- .NET c5 / dapper (Async, stored proc., 100 conns) => 16609.70

- .NET c6 / dapper (sync) => 18953.60
- .NET c6 / dapper (Async) => 19053.01

###### _show_ ->> `/retailer/42`

- Node.js / pg pool / pm2 => 50517.41
- Polka / pg pool / pm2 => 55327.29
- Express / pm2 => 30466.18
- Fastify / fastify-pg / pm2 => 32465.91
- Nanoexpress / pm2 => 29888.50
- Nestjs / fastify / prisma => 7474.85 (JfMJ)
- Py / Flask / gunicorn => 20647.20
- Rust / rocket / diesel => 65260.80
- Rust / actix / diesel => 59926.58
- Rust / warp / tokio_pg => 23455.55 (after ~6 runs... ??)

###### _show_ ->> `/Retailer[A?]Sync/42`

- .NET c5 / EF => 17312.92
- .NET c5 / dapper (sync) => 52209.81
- .NET c5 / dapper (sync, stored proc.) => 43100.49
- .NET c5 / dapper (sync, MessagePack bytes) => 51443.75
- .NET c5 / dapper (sync, Utf8Json) => 49226.00
- .NET c5 / dapper (Async, 100 conns) => 48944.83
- .NET c5 / dapper (Async, Utf8Json) => 49824.98
- .NET c5 / dapper (Async, stored proc., 100 conns) => 40137.15

- .NET c6 / dapper (sync) => 47497.82
- .NET c6 / dapper (Async) => 51789.26

---

### Ryzen 7 5800H Laptop (test command -> `wrk`)

#### Environment

* Ryzen 7 5800h
* 16 GB Ram
* Arch Linux (Garuda)
* Python 3.7.11
* Node (JS) 16.9.1
* rustc ---
* Postgres 13.x

#### Test command

```bash
wrk -t 16 -c 200 <URL>
```

###### _all_ ->> `/retailers`

- Express / pg / pm2 => 14846.65
- Rust / rocket / diesel => 22602.61
- Rust (1.57) / diesel => 19309.70
- Phoenix (Elixir) / ecto / json view => 6355.82
- Phoenix (Elixir) / ecto / Jason => 10540.54

###### _all_ ->> `/Retailer[A?]Sync`

- .NET c5 / dapper (sync, System.Text.Json) => 11177.24 (Nov. 9th 2021: 16177.48)
- .NET c5 / dapper (Async, System.Text.Json) => 14725.54 (Nov. 9th 2021: 16872.19)
 
- .NET c5 / dapper (sync, Utf8Json) => 11983.10
- .NET c5 / dapper (Async, Utf8Json) => 14959.06

- .NET c6 / dapper (sync, System.Text.Json) => 11708.14 (Nov. 27th 2021: 17267.13)
- .NET c6 / dapper (Async, System.Text.Json) => 15624.72 (Nov. 27th 2021: 17493.97) (Dec, 6th: 17609.47)

- .NET c6 / dapper (sync, SC generated JSON serialization) => 17042.81
- .NET c6 / dapper (Async, SC generated JSON serialization) => 17336.53

- .NET c6 / dapper (sync, SC generated JSON serialization UTF8-bytes) => 16508.15
- .NET c6 / dapper (Async, SC generated JSON serialization UTF8-bytes) => 17241.86
 
- .NET c6 / dapper (sync, Utf8Json) => 11229.95
- .NET c6 / dapper (Async, Utf8Json) => 15614.55

- .NET 6 / EF Core / sync => 10851.80

###### _all_ ->> `/retailer/42`

- Express / pg / pm2 => 20039.75
- Rust / rocket / diesel => 55798.49
- Rust (1.57) / diesel => 45688.32
- Phoenix (Elixir) / ecto / json view => 30344.54
- Phoenix (Elixir) / ecto / Jason => 33153.59

###### _show_ ->> `/Retailer[A?]Sync/42`

- .NET c5 / dapper (sync, System.Text.Json) => 30092.94 (Nov. 9th 2021: 41997.21)
- .NET c5 / dapper (Async, System.Text.Json) => 39073.78 (Nov. 9th 2021: 44733.87)
- 
- .NET c5 / dapper (sync, Utf8Json) => 33520.80
- .NET c5 / dapper (Async, Utf8Json) => 39793.88

- .NET c6 / dapper (sync, System.Text.Json) => 30138.83 (Nov. 27th 2021: 41068.56)
- .NET c6 / dapper (Async, System.Text.Json) => 40684.14 (Nov. 27th 2021: 43943.26)

- .NET c6 / dapper (sync, SC generated JSON serialization) => 41646.04
- .NET c6 / dapper (Async, SC generated JSON serialization) => 44662.39

- .NET c6 / dapper (sync, SC generated JSON serialization UTF8-bytes) => 46630.94
- .NET c6 / dapper (Async, SC generated JSON serialization UTF8-bytes) => 44626.03
 
- .NET c6 / dapper (sync, Utf8Json) => 30804.70
- .NET c6 / dapper (Async, Utf8Json) => 40535.39

- .NET 6 / EF Core / sync => 13930.44


##### Ubuntu 21.10 / Postgres 14 (!! NO PERFORMANCE MODE !!)

###### _all_ ->>

- Express (Node 17.2) / pg / pm2 => 13282.31
- Rocket (1.44 nightly) / diesel => 24095.65
- Actix (1.57) / diesel / r2d2 => 23659.26
- Warp (1.57) / mobc => 13990.00
- .NET 5 / dapper / sync => 10039.47
- .NET 5 / dapper / async => 14701.96
- .NET 6 / dapper / sync => 10747.95
- .NET 6 / dapper / async => 15544.70
- .NET 6 / EF Core / sync => 6829.01

###### _show_ ->>

- Express (Node 17.2) / pg / pm2 => 24508.36
- Rocket (1.44 nightly) / diesel => 51423.80
- Actix (1.57) / diesel / r2d2 => 50895.81
- Warp (1.57) / mobc => 16738.81
- .NET 5 / dapper / sync => 24663.15
- .NET 5 / dapper / async => 36540.49
- .NET 6 / dapper / sync => 25659.31
- .NET 6 / dapper / async => 38103.64
- .NET 6 / EF Core / async => 10316.96

##### Fedora 36 / Postgres 14 

> NET version 7 preview 7
> GO(lang) version go1.18.3 linux/amd64

###### _all_ ->>

> pgxpool

- Iris / statement cache = 10 => 28694.05 (27143.63 on July 2nd 22')
- Iris / NO statement cache => 24515.83 (22923.64 on July 2nd 22')
- Fiber / statement cache = 10 => 30155.94
- Fiber / NO statement cache => 26156.61
- Gorilla / mux / statement cache = 10 => 26151.59
- Gorilla / mux / NO statement cache => 22627.38
- Gorilla / mux / go-json / statement cache = 10 => 28043.39
- Gorilla / mux / sonic / statement cache = 10 => 27833.19
- Echo / statement cache = 10 => 27893.04
- Gin / statement cache = 10 => 26181.52

> gorm

- Gorilla / mux / sonic => 15998.03

> entgo.io

- Gin => 14269.35

> .NET

- 7 preview 7 / ef / sync => 11269.33
- 7 preview 7 / ef / async / asnotracking => 15008.69

###### _show_ ->>

- Iris / statement cache = 10 =>  116397.02 (95570.30 on July 2nd 22')
- Iris / NO statement cache => 64099.76 (54990.79 on July 2nd 22')
- Fiber /statement cache = 10 => 114355.39
- Fiber / NO statement cache => 61900.93
- Gorilla / mux / statement cache = 10 => 91912.26
- Gorilla / mux / NO statement cache => 53697.67
- Gorilla / mux / go-json / statement cache = 10 => 90613.69
- Gorilla / mux / sonic / statement cache = 10 => 93976.48
- Echo / statement cache = 10 => 96341.07
- Gin / statement cache = 10 => 94153.76

> gorm

- Gorilla / mux / sonic => 69376.73

> entgo.io

- Gin => 45260.59

> .NET

- 7 preview 7 / ef / sync => 23614.20
- 7 preview 7 / ef / async / asnotracking => 24020.41

---

### Mac Mini M2 Pro

#### Environment

* M2 Pro
* 16 GB Ram
* Mac OS Ventura 13.2.1
* Python 3.9.13
* Node.js 18.14.2
* rustc ---
* Postgres 15.2

#### Test command

```bash
wrk -t 16 -c 200 <URL>
```

###### _all_ ->> `/retailers`

- Express / pg / pm2 => 15394.47

###### _show_ ->>

- Express / pg / pm2 => 23103.37


### MinisForum UM690

#### Environment

* Ryzen 9 6900HX
* 64 GB Ram
* Ubuntu 22.04 LTS
* Python 3.7.16
* Node.js 18.15.0
* Go 1.20.4
* Bun 0.5.9
* Postgres 14.7

```bash
wrk -t 16 -c 256 -d 30 <URL>
```

###### _all_ ->> `/retailers`

- .NET 7 / EF => 16544.74
- Node / Express / pg / pm2 => 16186.79
- Bun / Elysia / postgres / pm2 => 17797.89
- Go / Ent => 16755.45
- Go / Gin / pgxpool => 33938.89

###### _show_ ->> `/retailer/42`

- .NET 7 / EF => 27840.77
- Node / Express / pg / pm2 => 29369.05
- Bun / Elysia / postgres / pm2 => 54345.79 (- 65k / 75k , depending on test run & whether we re-start pm2... ??)
- Go / Ent => 56061.32
- Go / Gin / pgxpool => 146113.31
