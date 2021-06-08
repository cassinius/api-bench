mod db;
mod error;
mod handler;
mod models;

use mobc::{Connection, Pool};
use mobc_postgres::{tokio_postgres, PgConnectionManager};
use std::convert::Infallible;
use tokio_postgres::NoTls;
use warp::{Filter, Rejection};

type Result<T> = std::result::Result<T, Rejection>;
type DBCon = Connection<PgConnectionManager<NoTls>>;
type DBPool = Pool<PgConnectionManager<NoTls>>;

use models::{Msg, Retailer};

const HOST: [u8; 4] = [127, 0, 0, 1];
const PORT: u16 = 8000;

#[tokio::main]
async fn main() {
	let db_pool = db::create_pool().expect("database pool created.");

	let health_route = warp::path!("health")
		.and(with_db(db_pool.clone()))
		.and_then(handler::health_handler)
		.map(|arg| {
			warp::reply::json(&Msg {
				status: Some(String::from("OK")),
				msg: String::from("DB connection seems to work."),
			})
		});

	let root = warp::path::end().map(|| {
		warp::reply::json(&Msg {
			status: None,
			msg: String::from("Server running at warp speed.....!"),
		})
	});

	let api_v1 = warp::path!("api" / "v1").map(|| {
		warp::reply::json(&Msg {
			status: Some(String::from("OK")),
			msg: String::from("API v1 up and running."),
		})
	});

	let routes = warp::get().and(
		root
			.or(health_route)
			.or(api_v1)
			.with(warp::cors().allow_any_origin())
			.recover(error::handle_rejection),
	);

	warp::serve(routes).run((HOST, PORT)).await;
}

// Me non understands, jabba jabba
fn with_db(db_pool: DBPool) -> impl Filter<Extract = (DBPool,), Error = Infallible> + Clone {
	warp::any().map(move || db_pool.clone())
}
