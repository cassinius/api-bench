import cors from "cors";
import nanoexpress, { IHttpRequest, IHttpResponse } from "nanoexpress";

import { pool } from "./db_conn";

export const app = nanoexpress();
// app.use((req, res, next) => {
//   cors();
//   next();
// });

const PORT: number = 8000;
const LIMIT = 42;

let DB_client = null;

function checkDBConn(res) {
  if (!DB_client) {
    res.status(500).json({
      status: 500,
      msg: "DB connection not initialized.",
    });
  }
}

/**
 * @todo introduce random retailer lookup...
 * @todo figure out if pg pool has any cache => delete if yes!
 */
const getRetailer = (req, res, id = LIMIT) => {
  checkDBConn(res);
  pool.query("SELECT * FROM retailer WHERE id=$1", [id], (err, result) => {
    if (err) {
      console.log(err);
    }
    res.status(200).json(result.rows);
  });
};

const getAllRetailers = (req, res) => {
  checkDBConn(res);
  pool.query("SELECT * FROM retailer", [], (err, result) => {
    if (err) {
      console.log(err);
    }
    res.status(200).json(result.rows);
  });
};

app.get("/", (req: IHttpRequest, res: IHttpResponse) => {
  res.status(200);
  return res.send({
    status: 200,
    msg: "Retailer API up and running.",
  });
});

app.get("/retailers", (req, res) => {
  getAllRetailers(req, res);
});

app.get("/retailer/:id", (req, res) => {
  getRetailer(req, res, +req.params.id);
});

async function MAIN() {
  const port = +process.env.PORT || PORT;
  const client = await app.listen(port);
  DB_client = await pool.connect().catch(e => console.log(e));
  console.log(`Server listening on port ${port}.`);
}

MAIN();
