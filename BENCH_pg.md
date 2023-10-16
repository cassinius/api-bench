## Performance benchmarks

### Linux ARM64 server

#### Command

```bash
wrk -t 16 -c 256 -d 30 <url>
```

#### Environment

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

#### Results
if ou 
##### _all_ ->> `/retailers`

- Py / Flask / gunicorn => 13060.61
- Node / Express / pg / pm2 => 14893.54
- Bun / postgres / pm2 => 13753.42
- Bun / pg / drizzle / pm2 => 
- .NET 8 / EF => 11696.56
- .NET 8 / Dapper => 14839.13
- .NET 8 / npgsql ADO.NET => 16631.39
- Golang / Ent => 10351.31
- Golang / Gin / pgxpool => 20284.86

##### _show_ ->> `/retailer/42`

- Py / Flask / gunicorn => 17045.36
- Node / express / pg-pool => 19061.33
- Bun / postgres / pm2 => 30784.32
- Bun / pg / drizzle / pm2 => 
- .NET 8 / EF => 17134.61
- .NET 8 / Dapper => 31858.73
- .NET 8 / npgsql ADO.NET => 32927.07
- Golang / Ent => 35609.91
- Golang / Gin / pgxpool => 83475.48

---
