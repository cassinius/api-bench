const url = require("url");
const http = require("http");
const { pool } = require("./db_conn");
const fastJson = require("fast-json-stringify");
const stringify = fastJson({
  title: "Retailer",
  type: "object",
  properties: {
    id: { type: "integer" },
    GSTIN: { type: "string" },
    Business_name: { type: "string" },
    Contact_person: { type: "string" },
    Contact_number: { type: "integer" },
    Contact_address: { type: "string" },
    Contact_emailId: { type: "string" },
    Status: { type: "string" },
    Outlet_limit: { type: "integer" },
  },
});

const PORT = process.env.PORT || 8000;

let DB_client = null;

function checkDBConn(res) {
  if (!DB_client) {
    const error = {
      status: 500,
      msg: "DB connection not initialized.",
    };
    res.statusCode = 500;
    res.end(JSON.stringify(error));
  }
}

/**
 * @todo introduce random retailer lookup...
 * @todo figure out if pg pool has any cache => delete if yes!
 */
const getRetailer = (req, res, id = 42) => {
  checkDBConn(res);
  pool.query("SELECT * FROM retailer WHERE id=$1", [id], (err, result) => {
    if (err) {
      console.log(err);
    }
    res.statusCode = 200;
    // console.log(result.rows);
    res.end(stringify(result.rows[0]));
  });
};

const getAllRetailers = (req, res) => {
  checkDBConn(res);
  pool.query("SELECT * FROM retailer", [], (err, result) => {
    if (err) {
      console.log(err);
    }
    res.statusCode = 200;
    res.end(JSON.stringify(result.rows));
  });
};

const server = http.createServer((req, res) => {
  if (req.method === "GET") {
    const urlArr = req.url.split("/");

    switch (urlArr[1]) {
      case "retailers":
        getAllRetailers(req, res);
        break;
      case "retailer":
        getRetailer(req, res, urlArr[2]);
        break;
      default:
        const status = {
          status: 200,
          msg: "Retailer API up and running.",
        };
        res.statusCode = 200;
        res.end(JSON.stringify(status));
    }
  }
});

server.listen(PORT, async () => {
  DB_client = await pool.connect().catch((e) => console.log(e));
  console.log(`Server is listening on port ${PORT} 🚀`);
});
