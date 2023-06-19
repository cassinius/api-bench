import { Elysia } from "elysia";
import { swagger } from "@elysiajs/swagger";

import { eq, placeholder } from "drizzle-orm";

import db, { sql } from "./db";
import { RetailerType, retailers } from "./schema";

// import { sia, desia, Sia, DeSia, constructors } from "sializer";
// import fastJson from "fast-json-stringify";
// import TSON from "typescript-json";

import {
  checkRetailer,
  stringifyRetailer,
  isStringifyRetailer,
  checkRetailerArray,
  stringifyRetailerArray,
  isStringifyRetailerArray,
} from "./templates/tsonRetailer";

/**
 * fast-json-stringify schema definition
 */
// const stringifySingle = fastJson({
//   title: "Retailer",
//   type: "object",
//   properties: {
//     id: { type: "number" },
//     GSTIN: { type: "string" },
//     businessName: { type: "string" },
//     contactPerson: { type: "string" },
//     contactNumber: { type: "number" },
//     contactAddress: { type: "string" },
//     contactEmail: { type: "string" },
//     status: { type: "string" },
//     outletLimit: { type: "number" },
//   },
// });

// const stringifyArray = fastJson({
//   title: "Retailers",
//   type: "array",
//   items: {
//     type: "object",
//     properties: {
//       id: { type: "number" },
//       GSTIN: { type: "string" },
//       businessName: { type: "string" },
//       contactPerson: { type: "string" },
//       contactNumber: { type: "number" },
//       contactAddress: { type: "string" },
//       contactEmail: { type: "string" },
//       status: { type: "string" },
//       outletLimit: { type: "number" },
//     },
//   },
// });

/**
 * Drizzle prepared statements / queries
 */
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

    // "normal" serialization
    return allRetailers;

    // sializer
    // return sia(allRetailers);

    // fast-json-stringify
    // return stringifyArray(allRetailers);

    // typia - needs extra setup step...
    // return stringifyRetailerArray(allRetailers);
  })
  .get("/retailer/:id", async ({ params: { id } }) => {
    // const queryResult = await db
    //   .select()
    //   .from(retailers)
    //   .where(eq(retailers.id, +id));
    const queryResult = await singleRetailerQuery.execute({ id: +id });
    const singleRetailer: RetailerType = queryResult[0];

    // "normal" serialization
    return singleRetailer;

    // sializer
    // return sia(singleRetailer);

    // fast-json-stringify
    // return stringifySingle(singleRetailer);

    // typia - needs extra setup step...
    // return stringifyRetailer(singleRetailer);
  })
  .listen(8000);

console.log(
  `🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`
);
