// import cors from "cors";
import nanoexpress, { IHttpRequest, IHttpResponse } from "nanoexpress";

import { pool } from "./db_conn";

export const app = nanoexpress();

// const corsConfigured = cors({
//   origin: 'http://localhost:8000',
//   allowedHeaders: ['Content-Type', 'Authorization'],
//   preflightContinue: false,
//   optionsSuccessStatus: 200 // some legacy browsers (IE11, various SmartTVs) choke on 204
// });
// app.options('/*', corsConfigured as unknown)

const PORT: number = 8000;

let DB_client = null;

function checkDBConn(req, res: IHttpResponse, next) {
  if (!DB_client) {
    res.status(500).send({
      status: 500,
      msg: "DB connection not initialized.",
    });
  }
  next();
}

app.use(checkDBConn as unknown as any);

app.get("/", (req: IHttpRequest, res: IHttpResponse) => {
  res.status(200);
  return res.send({
    status: 200,
    msg: "Retailer API up and running.",
  });
});

app.get("/retailers", async (req: IHttpRequest, res: IHttpResponse) => {
  const result = await pool.query("SELECT * FROM retailer", []); //.catch(e => console.error(e));
  return res.status(200).send(result.rows);
});

app.get("/retailer/:id", async (req: IHttpRequest, res: IHttpResponse) => {
  const result = await pool.query("SELECT * FROM retailer WHERE id=$1", [req.params.id]);
  return res.status(200).send(result.rows);
});

async function MAIN() {
  const port = +process.env.PORT || PORT;
  const client = await app.listen(port);
  DB_client = await pool.connect().catch(e => console.log(e));
  console.log(`Server listening on port ${port}.`);
}

MAIN();
