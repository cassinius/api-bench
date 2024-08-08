import { drizzle } from "drizzle-orm/mysql2";
import mysql, { PoolOptions } from "mysql2/promise";
import * as schema from "./schema";

// console.log({ schema });

const dbConfig = {
  host: "localhost",
  user: "retailer",
  password: "retailer",
  database: "retailer_api",
  port: 3506,
  // connectionLimit: 500,
} satisfies PoolOptions;

export const pool = await mysql.createPool(dbConfig);
export const db = drizzle(pool, { schema, mode: "default" });
