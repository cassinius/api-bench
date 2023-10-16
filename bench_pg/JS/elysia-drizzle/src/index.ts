import { Elysia } from "elysia";

import { eq, sql as drzlsql } from "drizzle-orm";

import db, { sql } from "./db";
import { RetailerType, retailers } from "./schema";

const PORT = 8000;
const portSuffix = Bun.env.NODE_APP_INSTANCE || 0;

/**
 * Drizzle prepared statements / queries
 */
const allRetailersQuery = db.select().from(retailers).prepare("all");
const singleRetailerQuery = db
  .select()
  .from(retailers)
  .where(eq(retailers.id, drzlsql.placeholder("id")))
  .prepare("single");

const app = new Elysia()
  .get("/", () => ({
    status: 200,
    message: "Bun / Elysia / Drizzle Retailer API up and running...",
  }))
  .get("/pgversion", async () => {
    const version = await sql`SELECT VERSION()`;
    return {
      status: 200,
      message: `PostgreSQL version: ${version[0].version}`,
    };
  })
  .get("/retailers", async ({ request }) => {
    const allRetailers: RetailerType[] = await allRetailersQuery.execute();

    return allRetailers;
  })
  .get("/retailer/:id", async ({ params: { id } }) => {
    const queryResult = await singleRetailerQuery.execute({ id: +id });
    const singleRetailer: RetailerType = queryResult[0];

    return singleRetailer;
  })
  // .listen(PORT);
  .listen(PORT + +portSuffix);

console.log(
  `🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`
);
