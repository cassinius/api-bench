import { drizzle, PostgresJsDatabase } from "drizzle-orm/postgres-js";
import postgres from "postgres";

// NOTE will use psql environment variables, if no config object is specified
const sql = postgres({
  host: "localhost",
  port: 5432,
  database: "retailer_api",
  username: "retailer",
  password: "retailer",
});

const db: PostgresJsDatabase = drizzle(sql);

export { sql };

export default db;
