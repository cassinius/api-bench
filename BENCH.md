
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


### Ryzen 3950 workstation

#### Environment

* MUG Workstation
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

