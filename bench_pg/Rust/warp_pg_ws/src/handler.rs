use crate::{db, error::Error::*, models::*, DBPool, Result};
use serde::Deserialize;
use warp::{http::StatusCode, reject, reply::json, Reply};

#[derive(Deserialize)]
pub struct SearchQuery {
  search: Option<String>,
}

pub async fn health_handler(db_pool: DBPool) -> Result<impl Reply> {
  let db = db::get_db_con(&db_pool)
    .await
    .map_err(|e| reject::custom(e))?;
  db.execute("SELECT 1", &[])
    .await
    .map_err(|e| reject::custom(DBQueryError(e)))?;
  Ok(StatusCode::OK)
}

pub async fn list_retailers_handler(query: SearchQuery, db_pool: DBPool) -> Result<impl Reply> {
  let retailers = db::fetch_retailers(&db_pool)
    .await
    .map_err(|e| reject::custom(e))?;
  Ok(json::<Vec<_>>(&retailers))
}

pub async fn show_retailer_handler(query: SearchQuery, db_pool: DBPool) -> Result<impl Reply> {
  let retailer = db::show_retailer(&db_pool)
    .await
    .map_err(|e| reject::custom(e))?;
  Ok(json::<>(&retailer))
}
