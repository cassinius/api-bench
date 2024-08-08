import { getConnection } from "./db";

const PORT = 8000;

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
      const conn = await getConnection();

      const allRetailers = await conn.query(`SELECT * FROM retailers`);

      return new Response(JSON.stringify(allRetailers), { status: 200 });
    }

    if (path.startsWith("/api/retailer/")) {
      const id = path.split("/").pop() || "";

      const conn = await getConnection();

      const singleRetailer = await conn.query(
        "SELECT * FROM retailers WHERE id=(?)",
        [id]
      );

      return new Response(JSON.stringify(singleRetailer), { status: 200 });
    }

    return new Response(`BUN requested on ${path}`);
  },
});

console.log("Bun baking on port", PORT);
