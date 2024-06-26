import mariadb, { PoolConnection } from 'mariadb';

const pool = mariadb.createPool({
  host: 'localhost',
  user: 'retailer',
  password: 'retailer',
  database: 'retailer_api',
  connectionLimit: 50,
  port: 3506
});

// console.log(pool);

let conn: PoolConnection;
async function getConnection() {
  if (!conn) {
    conn = await pool.getConnection();
  }
  return conn;
}

export { getConnection };
