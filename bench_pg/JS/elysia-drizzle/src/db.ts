import { drizzle, PostgresJsDatabase } from "drizzle-orm/postgres-js";
import postgres from "postgres";

const sql = postgres({
  host: "localhost",
  port: 5432,
  database: "retailer_api",
  username: "retailer",
  password: "retailer",
  /* options */
}); // will use psql environment variables

const db: PostgresJsDatabase = drizzle(sql);

export { sql };

export default db;
