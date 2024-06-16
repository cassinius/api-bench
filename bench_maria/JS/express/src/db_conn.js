const mariadb = require('mariadb');

const pool = mariadb.createPool({
  host: 'localhost',
  user: 'retailer',
  password: 'retailer',
  database: 'retailer_api',
  connectionLimit: 50,
  port: 3506
});

// console.log(pool);

module.exports = { pool }
