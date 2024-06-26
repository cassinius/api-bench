import { drizzle } from "drizzle-orm/mysql2";
import mysql from "mysql2/promise";
import * as schema from "./schema";

// console.log({ schema });

const dbConfig = {
  host: "localhost",
  user: "retailer",
  password: "retailer",
  database: "retailer_api",
  connectionLimit: 50,
  port: 3506,
};

export const pool = await mysql.createPool(dbConfig);
export const db = drizzle(pool, { schema, mode: "default" });
