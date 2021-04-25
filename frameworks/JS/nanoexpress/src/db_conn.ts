import { Pool } from "pg";

const pool = new Pool({
  host: "localhost",
  user: "retailer",
  password: "retailer",
  database: "retailer_api",
  connectionTimeoutMillis: 500,
  port: 5432,
});

console.log('PG pool:', pool);

export { pool };
