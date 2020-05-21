const fastify = require("fastify")();

const PORT = process.env.PORT || 8000;

fastify.register(require("fastify-postgres"), {
  connectionString: "postgres://retailer:retailer@localhost:5432/retailer_api",
  native: false,
});

fastify.get("/", async (req, res) => {
  const response = {
    status: 200,
    msg: "Retailer API up and running.",
  };
  // can use `res.send()` - OR - simply return ;-)
  // res.send(response);
  return response;
});

fastify.get("/retailers", async (req, res) => {
  const client = await fastify.pg.connect();
  const rows = await client
    .query("SELECT * FROM retailer", [])
    .catch((e) => console.log(e));
  client.release();
  return rows;
});

fastify.get("/retailer/:id", async (req, reply) => {
  const client = await fastify.pg.connect();
  const { rows } = await client.query("SELECT * FROM retailer WHERE id=$1", [
    req.params.id,
  ]);
  client.release();
  return rows;
});

fastify.listen(PORT, (err) => {
  if (err) throw err;
  console.log(`server listening on ${fastify.server.address().port}`);
});
