use crate::{models::*, db, error::Error::*, DBPool, Result};
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
