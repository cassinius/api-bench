import { eq, sql as drzlsql } from "drizzle-orm";
import { type RetailerType, retailers } from "./schema";
import { db } from "./db";

const PORT = 8000;
// const portSuffix = Bun.env.NODE_APP_INSTANCE || 0;

/**
 * Drizzle prepared statements / queries
 */
const allRetailersQuery = db.select().from(retailers).prepare();
const singleRetailerQuery = db
  .select()
  .from(retailers)
  .where(eq(retailers.id, drzlsql.placeholder("id")))
  .prepare();

Bun.serve({
  port: PORT,
  development: false,

  // Multi-CPU
  reusePort: true,

  async fetch(req) {
    const url = new URL(req.url);
    const path = url.pathname;
    // console.log("Bun requested on", path);

    if (path === "/api/retailers") {
      const allRetailers: RetailerType[] = await allRetailersQuery.execute();

      return new Response(JSON.stringify(allRetailers), { status: 200 });
    }

    if (path.startsWith("/api/retailer/")) {
      const id = path.split("/").pop() || "";

      const queryResult = await singleRetailerQuery.execute({ id: +id });

      const singleRetailer: RetailerType = queryResult[0];

      return new Response(JSON.stringify(singleRetailer), { status: 200 });
    }

    return new Response(`BUN requested on ${path}`);
  },
});

console.log("Bun baking on port", PORT);
