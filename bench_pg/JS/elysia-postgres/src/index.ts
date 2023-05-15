import { Elysia } from "elysia";
import { swagger } from "@elysiajs/swagger";

import sql from "./db";

const app = new Elysia()
  .use(swagger())
  .get("/", () => ({
    status: 200,
    message: "Bun / Elysia / Postgres.js Retailer API up and running...",
  }))
  .get("/pgversion", async () => {
    const version = await sql`SELECT VERSION()`;
    return {
      status: 200,
      message: `PostgreSQL version: ${version[0].version}`,
    };
  })
  .get("/retailers", async ({ request }) => {
    const retailers = await sql`SELECT * FROM retailer;`;
    return JSON.stringify(retailers);
  })
  .get("/retailer/:id", async ({ params: {id} }) => {
    const retailer = await sql`SELECT * FROM retailer WHERE id = ${+id};`;
    return JSON.stringify(retailer);
  })
  .listen(8000);

console.log(
  `🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`
);
