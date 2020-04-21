const express = require('express');
// const bodyParser = require('body-parser');
const cors = require('cors');
const { pool } = require('./db_conn');

const app = express();

// app.use(bodyParser.json());
// app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());

const DEFAULT_PORT = 8000;

let DB_client = null;


/**
 * @todo introduce random retailer lookup...
 * @todo figure out if pg pool has any cache => delete if yes!
 */
const getRetailer = (req, res, id=42) => {
  if ( !DB_client ) {
    res.status(500).json({
      status: 500,
      msg: 'DB connection not initialized.'
    });
  }
  pool.query("SELECT * FROM retailer WHERE id=$1", [id], (err, result) => {
    if (err) { 
      console.log(err); 
    }
    res.status(200).json(result.rows);
  });
}


app.get('/', (req, res) => {
  res.status(200).json({
    status: 200, 
    msg: 'Retailer API up and running.'
  });
});


app.get('/retailer/:id', (req, res) => {
  getRetailer(req, res, req.params.id);
});


// Start server
const port = process.env.PORT || DEFAULT_PORT;
app.listen(port, async () => {
  DB_client = await pool.connect().catch(e => console.log(e));
  console.log(`Server listening on port ${port}.`);
});
