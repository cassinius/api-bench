use crate::{error, error::Error::*, models::*, DBCon, DBPool};
use chrono::prelude::*;
use mobc::Pool;
use mobc_postgres::{tokio_postgres, PgConnectionManager};
use std::fs;
use std::str::FromStr;
use std::time::Duration;
use tokio_postgres::{Config, Error, NoTls};

type Result<T> = std::result::Result<T, error::Error>;

const DB_POOL_MAX_OPEN: u64 = 32;
const DB_POOL_MAX_IDLE: u64 = 8;
const DB_POOL_TIMEOUT_SECONDS: u64 = 15;

const INIT_SQL: &str = "./db.sql";
const TABLE: &str = "retailer";
const SELECT_FIELDS: &str =
  "id, GSTIN, Business_name, Contact_person, Contact_number, Contact_address, Contact_emailId, Status, Outlet_limit";

pub async fn init_db(db_pool: &DBPool) -> Result<()> {
  let init_file = fs::read_to_string(INIT_SQL)?;
  let con = get_db_con(db_pool).await?;
  con.batch_execute(init_file.as_str())
    .await
    .map_err(DBInitError)?;
  Ok(())
}

pub async fn get_db_con(db_pool: &DBPool) -> Result<DBCon> {
  db_pool.get().await.map_err(DBPoolError)
}

pub fn create_pool() -> std::result::Result<DBPool, mobc::Error<Error>> {
  let config = Config::from_str("postgres://retailer:retailer@127.0.0.1:5432/retailer_api")?;

  let manager = PgConnectionManager::new(config, NoTls);
  Ok(
    DBPool::builder()
      .max_open(DB_POOL_MAX_OPEN)
      .max_idle(DB_POOL_MAX_IDLE)
      .get_timeout(Some(Duration::from_secs(DB_POOL_TIMEOUT_SECONDS)))
      .build(manager),
  )
}
