// db.js
import postgres from "postgres";

const sql = postgres({
  host: "localhost",
  port: 5432,
  database: "retailer_api",
  username: "retailer",
  password: "retailer",
  /* options */
}); // will use psql environment variables

export default sql;
