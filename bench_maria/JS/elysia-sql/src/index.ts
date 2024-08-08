import { Elysia } from "elysia";
import { getConnection } from "./db";

const PORT = 8000;
const portSuffix = Bun.env.NODE_APP_INSTANCE || 0;

const app = new Elysia()
  .get("/", () => ({
    status: 200,
    message: "Bun / Elysia / Postgres.js Retailer API up and running...",
  }))
  .get("/api/retailers", async () => {
    const conn = await getConnection();
    const retailers = await conn.query(`SELECT * FROM retailers`);
    return JSON.stringify(retailers);
  })
  .get("/api/retailer/:id", async ({ params: { id } }) => {
    const conn = await getConnection();
    const retailer = await conn.query("SELECT * FROM retailers WHERE id=(?)", [
      id,
    ]);
    return JSON.stringify(retailer);
  })
  .listen(PORT + +portSuffix);

console.log(
  `🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`
);
