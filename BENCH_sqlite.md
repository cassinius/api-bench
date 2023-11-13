## Macbook Air M2 15"

### Command

```bash
wrk -t 16 -c 256 -d 30 <url>
```

### Results (single core)

#### _all_ ->> `/retailers`

* Bun / Elysia / Drizzle => 4706.73 (vs. 3558.67 Pg)

#### _show_ ->> `/retailer/42`

* Bun / Elysia / Drizzle => 15962.49 (vs. 21002.56 Pg)
