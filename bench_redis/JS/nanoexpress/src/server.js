const nanoexpress = require("nanoexpress");
const redis = require('redis');

const PORT = 8000;

const redisUrl = "redis://localhost:6379/7";
const redisClient = redis.createClient(redisUrl);
// console.log(redisClient);

const app = nanoexpress();

app.use(redisClient);

/**
 * 
 */
app.get("/", (req, res) => {
  res.status(200);
  return res.send({
    status: 200,
    msg: "Retailer API up and running.",
  });
});

/**
 * 
 */
app.get("/retailer/:id", async (req, res) => {
  redisClient.get(req.params.id, (err, data) =>
    res.status(200).send({ status: 200, retailer: JSON.parse(data) }));
});

/**
 * 
 */
 app.get("/retailers", async (req, res) => {
  redisClient.KEYS("*", (err, keys) => {
    // console.log(keys);
    redisClient.mget(keys, (err, data) => {
      let strRes = data.join(',');
      strRes = "[" + strRes;
      strRes = strRes + "]";
      // console.log(JSON.parse(strRes));
      return res.status(200).send({ status: 200, retailers: JSON.parse(strRes) });
    });
  });
});

// Start server
const port = process.env.PORT || PORT;
app.listen(port).then(() => console.log(`Nanoexpress server listening on port ${port}.`));
