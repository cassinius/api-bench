## Schema and modeling

0. Set old rustc version
```bash
rustup override set nightly-2020-04-20
```

1. set DB URL
```bash
echo DATABASE_URL=postgres://retailer:retailer@localhost:5432/retailer_api > .env
```

2. read DB into schema
```bash
diesel print-schema > src/schema.rs
```

3. install diesel (with feature `postgres`)
```bash
cargo install diesel --no-default-features --features postgres
```

3. install diesel_cli_ext
```bash
cargo install diesel_cli_ext
```

4. generate models
```bash
diesel_ext > src/models.rs
```


## Misc

* Error *`error_chain` is ambiguous (derive helper attribute vs any other name)* came from having `dotenv` explicitly installed with a different version than as dependency of now-obsolete `diesel_codegen`

