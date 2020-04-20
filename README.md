# Readme, API bench

This is our testbed for API-(Micro-)Services in different languages & frameworks. At the time of this writing (2020-04-20) we got

* Python
  - Flask
  - Falcon
* Node
  - Express
* Rust
  - rocket


### Performance measures:

* Falcon / gunicorn (4 workers) => ~800-1k req/sec.
* Flask / gunicorn (4 workers) => ~1.5k-2.5k req/sec.
* Node / express (pg pool, auto # workers) => ~3-11k req/sec. !!!
