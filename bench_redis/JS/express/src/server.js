const express = require('express');
const cors = require('cors');
const redis = require('redis');

const app = express();
app.use(cors());

const PORT = 8000;

const redisUrl = "redis://localhost:6379/7";
const redisClient = redis.createClient(redisUrl);

/**
 * 
 */
function checkDBConn(res) {
  if (!redisClient) {
    res.status(500).json({
      status: 500,
      msg: 'DB connection not initialized.'
    });
  }
}

/**
 * 
 */
app.get('/', (req, res) => {
  res.status(200).json({
    status: 200,
    msg: 'Retailer API up and running.'
  });
});


app.get('/retailers', (req, res) => {
  // checkDBConn();
  redisClient.KEYS("*", (err, keys) => {
    // console.log(keys);
    redisClient.mget(keys, (err, data) => {
      // let strRes = data.join(',');
      // strRes = "[" + strRes;
      // strRes = strRes + "]";
      // console.log(JSON.parse(strRes));
      res.status(200).json({ status: 200, retailers: data }); // JSON.parse(strRes)
    });
  });
});


app.get('/retailer/:id', (req, res) => {
  checkDBConn();
  redisClient.get(req.params.id, (err, data) =>
    res.status(200).json({ status: 200, retailer: JSON.parse(data) }));
});


// Start server
const port = process.env.PORT || PORT;
app.listen(port, async () => {
  console.log(`Server listening on port ${port}.`);
});
