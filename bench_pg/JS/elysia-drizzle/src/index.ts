import { Elysia } from "elysia";
import { swagger } from "@elysiajs/swagger";

import { eq } from "drizzle-orm";

import db, { sql } from "./db";
import { RetailerType, retailers } from "./schema";

const app = new Elysia()
  .use(swagger())
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
    const allRetailers: RetailerType[] = await db.select().from(retailers);
    return JSON.stringify(allRetailers);
  })
  .get("/retailer/:id", async ({ params: { id } }) => {
    const queryResult = await db
      .select()
      .from(retailers)
      .where(eq(retailers.id, +id));

    const singleRetailer: RetailerType = queryResult[0];
    return JSON.stringify(singleRetailer);
  })
  .listen(8000);

console.log(
  `🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`
);
