# Readme, API bench

This is our testbed for API-(Micro-)Services in different languages & frameworks. At the time of this writing (2020-04-20) we got

* Python
  - Flask
  - Falcon
* Node
  - Express
* Rust
  - rocket


### Performance measurements

#### Command

```bash
ab -n 100000 -k -c 16 http://localhost:8000/<path/to/action>
```

#### Environment

* core i7 quad
* OS: Arch linux
* Kernel: 5.5.4-arch1-1
* Postgres 12.2
* Python 3.7.4
* Node 13.12
* Rust 1.44 nightly
* default = 16 workers, except when `auto` (pg-pool)

#### Results (best of 3)

##### *all* ->> `/retailers`

* Py / Falcon / gunicorn => 1103.43 [#/sec] (mean)
* Py / Flask / gunicorn => 5823.22 [#/sec] (mean)
* Node / express / pg-pool => 3293.30 [#/sec] (mean)
* Rust / rocket / diesel => 16810.34 [#/sec] (mean)

##### *show* ->> `/retailer/42`

* Py / Falcon / gunicorn => 2808.54 [#/sec] (mean)
* Py / Flask / gunicorn => 8471.00 [#/sec] (mean)
* Node / express / pg-pool => 7613.39 [#/sec] (mean)
* Rust / rocket / diesel => 22121.07 [#/sec] (mean)
