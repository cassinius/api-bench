import * as path from "path";
import { Elysia } from "elysia";

import { BunSQLiteDatabase, drizzle } from 'drizzle-orm/bun-sqlite';
import { Database } from 'bun:sqlite';
import { eq, sql } from "drizzle-orm";

import * as schema from "./schema";
import { retailers } from "./schema";

const sqliteFile = path.join(import.meta.dir, '../../../../DB/sqlite/retailer.sqlite');
// console.log({ sqliteFile });

const sqlite = new Database(sqliteFile);
// console.log({ sqlite });

const db = drizzle(sqlite);
// console.log({ db })

/**
 * 
 */
const app = new Elysia()
  .get("/", () => ({ status: 200, msg: "Elysia Retailer API (SQLite Drizzle version) up and running." }))
  // .get("/dbVersion", async () => {
  //   const dbVersion = await db.run(sql`SELECT sqlite_version()`);
  //   console.log({ dbVersion });

  //   return {
  //     status: 200,
  //     msg: `SQLite version: ${dbVersion}`,
  //   }
  // })
  .get("/retailers", async () => {
    const result = await db.select().from(retailers).all();
    return result;
  })
  .get("/retailer/:id", async ({ params: { id } }) => {
    const result = await db.select().from(retailers).where(eq(retailers.id, id));
    return result;
  })
  .listen(8000);

console.log(
  `🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`
);
