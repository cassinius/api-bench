# Readme, API bench

This is our testbed for API-(Micro-)Services in different languages & frameworks. At the time of this writing (2021-06-14) we got:

- Java
  - es4x-app
- Python
  - flask
  - falcon
- Node
  - vanilla
  - express
  - nanoexpress
  - fastify
  - restify
  - polka
  - nestify / fastify
- Rust
  - rocket
  - actix
  - warp
- .NET
  - core 5.0 with EF

## Update, 2024-06-20

* Over the last 3 years, we added sub-projects for `Bun`, `Elixir`, `Golang` & newer `.NET` versions; on the other hand, we mostly ceased to test `Rust`, `Java`, `Python` as well as more esoteric JS-based frameworks.
* Since the only python-based sub-projects are in the `bench_pg` folder, we moved the `requirements.txt` file to this location.
* Since we are switching all DB-setups to `docker` & `compose`, removed the old Python DB generation scripts.
* There are new `docker/compose` setups for `MariaDB` as well as `Postgres`.
