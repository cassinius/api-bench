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
ab -n 10000 -c 8 http://localhost:8000/retailer/42
```

#### Environment

* Thinkpad X1 Carbon 5th gen
* Windows 10
* WSL Ubuntu 18.04
* Postgres 12.2
* Python 3.6.9
* Node 13.12
* Rust 1.44 nightly


#### Results (best of 3)

* Falcon / gunicorn (4 workers) => 773.48 [#/sec] (mean)
* Flask / gunicorn (4 workers) => 1783.23 [#/sec] (mean)
* Node / express (pg pool, auto # workers) => ~3-11k req/sec. !!!
* Rust / rocket (8 workers) => 
