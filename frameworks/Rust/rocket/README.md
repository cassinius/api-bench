1. set DB URL
```bash
echo DATABASE_URL=postgres://retailer:retailer@localhost:5432/retailer_api > .env
```

2. read DB into schema

```bash
diesel print-schema > src/schema.rs
```

3. install diesel_cli_ext

```bash
cargo install diesel_cli_ext
```

4. generate models

```bash
diesel_ext > src/models.rs
```

