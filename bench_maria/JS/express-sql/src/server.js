const express = require("express");
const cors = require("cors");
const { pool } = require("./db_conn");

const app = express();

app.use(cors());

const PORT = 8000;

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
const getRetailer = async (req, res, id = 42) => {
  checkDBConn();
  const rows = await DB_client.query("SELECT * FROM retailers WHERE id=(?)", [
    id,
  ]);
  // console.log(rows);
  res.status(200).json(rows);
};

const getAllRetailers = async (req, res) => {
  checkDBConn();
  const rows = await DB_client.query("SELECT * FROM retailers");
  // console.log(rows);
  res.status(200).json(rows);
};

app.get("/", (req, res) => {
  res.status(200).json({
    status: 200,
    msg: "Express Retailer API up and running...",
  });
});

app.get("/api/retailers", (req, res) => {
  getAllRetailers(req, res);
});

app.get("/api/retailer/:id", (req, res) => {
  getRetailer(req, res, req.params.id);
});

// Start server
const port = process.env.PORT || PORT;
app.listen(port, async () => {
  DB_client = await pool.getConnection().catch((e) => console.log(e));
  console.log(`Server listening on port ${port}.`);
});
