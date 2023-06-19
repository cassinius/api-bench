import { Elysia } from "elysia";
import { swagger } from "@elysiajs/swagger";

import { eq, placeholder } from "drizzle-orm";

import db, { sql } from "./db";
import { RetailerType, retailers } from "./schema";

const allRetailersQuery = db.select().from(retailers).prepare("all");
const singleRetailerQuery = db
  .select()
  .from(retailers)
  .where(eq(retailers.id, placeholder("id")))
  .prepare("single");

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
    // const allRetailers: RetailerType[] = await db.select().from(retailers);
    const allRetailers: RetailerType[] = await allRetailersQuery.execute();
    return allRetailers;
  })
  .get("/retailer/:id", async ({ params: { id } }) => {
    // const queryResult = await db
    //   .select()
    //   .from(retailers)
    //   .where(eq(retailers.id, +id));
    const queryResult = await singleRetailerQuery.execute({ id: +id });
    const singleRetailer: RetailerType = queryResult[0];
    return singleRetailer;
  })
  .listen(8000);

console.log(
  `🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`
);
