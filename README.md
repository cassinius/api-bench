# Readme, API bench

This is our testbed for API-(Micro-)Services in different languages & frameworks. At the time of this writing (2020-04-20) we got

* Python
  - Flask
  - Falcon
* Node
  - Express
* Rust
  - rocket


## Performance benchmarks

### Linux server

#### Command

```bash
ab -n 100000 -k -c 16 http://localhost:8000/<path/to/action>
```

#### Environment

* Hetzner server, core i7 quad
* OS: Arch linux
* Kernel: 5.5.4-arch1-1
* Postgres 12.2
* Python 3.7.4
* Python runner: gunicorn
* Node 13.12
* Rust 1.44 nightly
* default = 16 workers, except when `auto` (pg-pool)

#### Results

##### *all* ->> `/retailers`

* Py / Falcon / gunicorn => 1103.43 [#/sec] (mean)
* Py / Flask / gunicorn => 5823.22 [#/sec] (mean)
* Node / express / pg-pool => 1947.65 [#/sec] (mean)
* Rust / rocket / diesel => 10756.12 [#/sec] (mean)

##### *show* ->> `/retailer/42`

* Py / Falcon / gunicorn => 2824.16 [#/sec] (mean)
* Py / Flask / gunicorn => 8475.40 [#/sec] (mean)
* Node / express / pg-pool => 7613.39 [#/sec] (mean)
* Rust / rocket / diesel => 22200.08 [#/sec] (mean)


### Arch Linux Laptop


#### Results (best out of 3)

##### *all* ->> `/retailers`

* Py / falcon / gunicorn => 431.51 [#/sec] (mean)
* Py / flask / gunicorn => 2070.50 [#/sec] (mean)
* Node / express / pg-pool => 1549.49 [#/sec] (mean)
* Node / restify / pg-pool => 1766.46 [#/sec] (mean)
* Rust / rocket / diesel => 4782.41 [#/sec] (mean)

##### *show* ->> `/retailer/42`

* Py / falcon / gunicorn => 1060.58 [#/sec] (mean)
* Py / flask / gunicorn => 2791.79 [#/sec] (mean)
* Node / express / pg-pool => 5584.54 [#/sec] (mean)
* Node / restify / pg-pool => 5166.64 [#/sec] (mean)
* Rust / rocket / diesel => 11317.34 [#/sec] (mean)



### Windows client

#### Command

```bash
ab -n 10000 -k -c 8 http://localhost:8000/<path/to/action>
```

#### Environment

* Thinkpad X1 Carbon 5th gen (2017)
* core i7 due core low power...
* Windows 10
* Postgres 11.5
* Python 3.7.6
* Python runner: waitress
* Node 13.12
* Rust 1.44 nightly
* default = 16 workers, except when `auto` (pg-pool)


#### Comments / Errors

* Flask on Windows infrequently raises the following error while load testing (not while manually fetching):
```python
retailer = cursor.fetchall()
psycopg2.ProgrammingError: no results to fetch
```

#### Results (best out of 3)

##### *all* ->> `/retailers`

* Py / Falcon / gunicorn => 160.56 [#/sec] (mean)
* Py / Flask / gunicorn => 790.10 [#/sec] (mean)
* Node / express / pg-pool => 1087.38 [#/sec] (mean)
* Rust / rocket / diesel => 1496.27 [#/sec] (mean)

##### *show* ->> `/retailer/42`

* Py / Falcon / gunicorn => 474.28 [#/sec] (mean)
* Py / Flask / gunicorn => 990.77 [#/sec] (mean)
* Node / express / pg-pool => 3873.78 [#/sec] (mean)
* Rust / rocket / diesel => 3147.69 [#/sec] (mean)


