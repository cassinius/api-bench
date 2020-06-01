// require('dotenv').config()

const { Pool } = require('pg');

const pool = new Pool({
  host: 'localhost',
  user: 'retailer',
  password: 'retailer',
  database: 'retailer_api',
  connectionTimeoutMillis: 500,
  port: 5432
});

// console.log(pool);

module.exports = { pool }
