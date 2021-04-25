const { pool } = require('./db_conn');
const restify = require('restify');

const PORT = 8000;

let DB_client = null;

function checkDBConn(res) {
  if ( !DB_client ) {
    res.status(500).json({
      status: 500,
      msg: 'DB connection not initialized.'
    });
  }
}

/**
 * @todo introduce random retailer lookup...
 * @todo figure out if pg pool has any cache => delete if yes!
 */
const getRetailer = (req, res, id=42) => {
  checkDBConn();
  pool.query("SELECT * FROM retailer WHERE id=$1", [id], (err, result) => {
    if (err) { 
      console.log(err); 
    }
    res.status(200);
    res.json(result.rows);
  });
}


const getAllRetailers = (req, res) => {
  checkDBConn();
  pool.query("SELECT * FROM retailer", [], (err, result) => {
    if (err) { 
      console.log(err); 
    }
    res.status(200);
    res.json(result.rows);
  });
}


const server = restify.createServer({
  name: 'retailer',
  dtrace: true
});


server.get({path: '/', name: 'ApiStatus'}, function respond(req, res, next) {
  res.status(200);
  res.json({
    status: 'Ok',
    msg: 'Up and running.'
  });
  return next();
});


server.get({path: '/retailers', name: 'AllRetailers'}, function respond(req, res, next) {
  return getAllRetailers(req, res);
});


server.get({path: '/retailer/:id', name: 'GetRetailer'}, function respond(req, res, next) {
  getRetailer(req, res, req.params.id);
});


server.listen(PORT, async function() {
  DB_client = await pool.connect().catch(e => console.log(e));
  console.log('listening: %s', server.url);
});
