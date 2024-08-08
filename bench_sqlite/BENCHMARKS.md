## Macbook Air M2 15"

### Command

```bash
wrk -t 16 -c 256 -d 30 <url>
```

### Results (single core)

#### _all_ ->> `/retailers`

* Bun / Elysia / Drizzle => 4706.73
* Bun / Elysia / Drizzle (prepared) => 5591.32 (vs. 3558.67 Pg)

#### _show_ ->> `/retailer/42`

* Bun / Elysia / Drizzle => 15962.49 
* Bun / Elysia / Drizzle (prepared) => 42924.30 (vs. 21002.56 Pg)

## Linux ARM64 server 8-core

### Command

```bash
wrk -t 16 -c 256 -d 30 <url>
```

### Environment

- Hetzner server
- CPU: Ampere 8x vCPU
- RAM: 16 GB
- OS: Debian Bookworm
- Kernel: 6.1.0-13-arm64
- Postgres: 15.5
- Python: 3.9.18
- Python runner: gunicorn
- Node.js: v20.9.0
- Bun: 1.0.11
- Go: 1.19.8
- .NET: 8.0.rc2
- Docker: 20.10.24+dfsg1

### Results

#### _all_ ->> `/retailers`

* Bun / Elysia / Drizzle => only single core...

#### _show_ ->> `/retailer/42`

* Bun / Elysia / Drizzle => only single core...
