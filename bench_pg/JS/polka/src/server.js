const polka = require('polka');
const { pool } = require('./db_conn');
// const fastJson = require("fast-json-stringify");

// const retailer = {
//   title: "Retailer",
//   type: "object",
//   properties: {
//     id: { type: "integer" },
//     GSTIN: { type: "string" },
//     Business_name: { type: "string" },
//     Contact_person: { type: "string" },
//     Contact_number: { type: "integer" },
//     Contact_address: { type: "string" },
//     Contact_emailId: { type: "string" },
//     Status: { type: "string" },
//     Outlet_limit: { type: "integer" },
//   },
// };
// const stringifyOneRetailer = fastJson(retailer);
// const stringifyAllRetailers = fastJson({
//   title: "All Retailers",
//   type: "array",
//   items: retailer
// });

let DB_client = null;

/**
 * 
 */
function checkDBConn(res) {
  if (!DB_client) {
    const response = JSON.stringify({
      status: 500,
      msg: 'DB connection not initialized.'
    });
    res.end(response);
  }
}

/**
 * 
 */
polka()
  // .use(one, two)
  .get('/users/:id', (req, res) => {
    // console.log(`~> Hello, ${req.params.id}`);
    res.end(JSON.stringify({
      status: 'Ok',
      user: req.params.id
    }));
  })
  .get('/retailers', (req, res) => {
    checkDBConn(res);
    pool.query("SELECT * FROM retailer", [], (err, result) => {
      if (err) {
        console.log(err);
      }
      const retailers = JSON.stringify(result.rows);
      res.end(retailers);
    });
  })
  .get('/retailer/:id', (req, res) => {
    checkDBConn(res);
    pool.query("SELECT * FROM retailer WHERE id=$1", [req.params.id], (err, result) => {
      if (err) {
        console.log(err);
      }
      const retailer = JSON.stringify(result.rows[0]);
      res.end(retailer);
    });
  })
  .listen(8000, async () => {
    DB_client = await pool.connect().catch(e => console.log(e));
    console.log(`> Running on localhost:8000`);
  });

