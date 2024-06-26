# Performance benchmarks

## Minisforum UM780 XTX

### Command

```bash
wrk -t 16 -c 256 -d 30 <url>
```

### Environment

#### HW / SW

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
- Express: 4.19.2
- Bun: 1.1.17
- .NET: 8.0.302 + 9.0.100-preview.5

#### DB Layer

- ORMs
  + Ecto
  + EF (Entity Framework)
- Query Builders
  + Dapper
  + Drizzle
- Manual
  + Sql

### Results

#### _all_ ->> `/retailers`

- Elixir / Phoenix / Ecto => 10314.65
- NET 8.0.302 / EF 8 => 13586.06
- NET 9.0.100-p5 / EF 8 => 14439.60
- NET 8.0.302 / Dapper => 19795.94
- NET 9.0.100-p5 / Dapper => 20791.30
- Bun / Drizzle => 16825.90
- Node / Express / Sql => 25283.94
- Bun / Sql => 26947.09

#### _show_ ->> `/retailer/42`

- Elixir / Phoenix / Ecto => 33782.56
- NET 8.0.302 / EF 8 => 22257.06
- NET 9.0.100-p5 / EF 8 => 24249.55
- NET 8.0.302 / Dapper => 30080.97
- NET 9.0.100-p5 / Dapper => 39496.27
- Bun / Drizzle => 46980.21
- Node / Express / Sql => 46151.53
- Bun / Sql => 71929.96
