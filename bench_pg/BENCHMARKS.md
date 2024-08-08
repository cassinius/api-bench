# Performance benchmarks

## Linux ARM64 server 16-core

### Command

```bash
wrk -t 16 -c 256 -d 30 <url>
```

### Environment

- Hetzner server
- CPU: Ampere 16x vCPU
- RAM: 32 GB
- OS: Debian Bookworm
- Kernel: 6.1.0-12-arm64
- Postgres: 15.3
- Python: 3.9.18
- Python runner: gunicorn
- Node.js: v18.13.0
- Bun: 1.0.6
- Go: 1.19.8
- .NET: 8.0.rc2
- Docker: 20.10.24+dfsg1, build 297e128

### Results

#### _all_ ->> `/retailers`

- Py / Flask / gunicorn => 13060.61
- Node / Express / pg / pm2 => 14893.54
- Bun / pg / drizzle (prep) / pm2 => 11488.02
- Bun / postgres / pm2 => 13753.42
- .NET 8 / EF => 11696.56
- .NET 8 / EF compiled => 11526.07
- .NET 8 / Dapper => 14839.13
- .NET 8 / npgsql ADO.NET => 16631.39
- Golang / Ent => 10351.31
- Golang / Gin / pgxpool => 20284.86

#### _show_ ->> `/retailer/42`

- Py / Flask / gunicorn => 17045.36
- Node / express / pg-pool => 19061.33
- Bun / pg / drizzle (prep) / pm2 => 19227.10 
- Bun / postgres / pm2 => 30784.32 
- .NET 8 / EF => 17134.61
- .NET 8 / EF compiled => 19172.89
- .NET 8 / Dapper => 31858.73
- .NET 8 / npgsql ADO.NET => 32927.07
- Golang / Ent => 35609.91
- Golang / Gin / pgxpool => 83475.48

---


### MinisForum UM 790 Pro

#### Environment

* Ryzen 9 7940 HS
* 32 GB Ram
* Fedora 39
* Node.js 20.11.0
* Go 1.22.0
* Bun 1.0.27
* Postgres 16.1

```bash
wrk -t 16 -c 256 -d 30 <URL>
```

###### _all_ ->> `/retailers`

- .NET 8 / EF => 23813.39
- .NET 8 / EF compiled => 24272.56
- .NET 8 / Dapper => 29865.14
- .NET 8 / Npgsql => 36181.57
- Express / pg / pm2 => 22878.10
- Bun / Elysia / postgres / pm2 => 
- Bun / Elysia / drizzle-prepared / pm2 => 
- Go / Ent => 21912.31
- Go / Gin / pgxpool => 43376.76

###### _show_ ->> `/retailer/42`

- .NET 8 / EF => 40114.46
- .NET 8 / EF compiled => 44971.82
- .NET 8 / Dapper => 82980.33
- .NET 8 / Npgsql => 85395.02
- Express / pg / pm2 => 30367.38
- Bun / Elysia / postgres / pm2 =>
- Bun / Elysia / drizzle-prepared / pm2 => 
- Go / Ent => 68234.38
- Go / Gin / pgxpool => 193956.28

---

## Minisforum UM780 XTX

### Command

```bash
wrk -t 16 -c 256 -d 30 <url>
```

### Environment

- Minisforum UM780 XTX
- CPU: AMD Ryzen 7 7840HS (8 Cores / 16 Threads)
- RAM: 64GB (2x 32GB) Crucial DDR5 5600 MHz
- OS: EndeavourOS (Arch)
- Kernel: 6.9.4-arch1-1 (x64)
- Runtime: Docker 26.1.4
- MariaDB: 11.4.2-MariaDB, client 15.2 for debian-linux-gnu (x86_64)
- Elixir: 1.17.0 / Erlang/OTP 27 [erts-15.0]
- Phoenix: 1.7.12
- Node.js: 20.14.0
- Bun: 1.1.14
- .NET: 9.0.100-preview.5

### Results

###### _all_ ->> `/retailers`

- Elixir / Phoenix => 12561.00

###### _show_ ->> `/retailer/42`

- Elixir / Phoenix => 41680.33
