//! Actix web Diesel integration example
//!
//! Diesel does not support tokio, so we have to run it in separate threads using the web::block
//! function which offloads blocking code (like Diesel's) in order to not block the server's thread.


#[macro_use]
extern crate diesel;

use actix_web::{get, web, App, Error, HttpResponse, HttpServer}; //, post , middleware
use diesel::pg::PgConnection;
use diesel::r2d2::{self, ConnectionManager};
// use uuid::Uuid;

mod actions;
mod models;
mod schema;

type DbPool = r2d2::Pool<ConnectionManager<PgConnection>>;

/// Finds retailer by UID.
#[get("/retailer/{r_id}")]
async fn get_retailer(
	pool: web::Data<DbPool>,
	r_id: web::Path<i32>,
) -> Result<HttpResponse, Error> {
	let r_id = r_id.into_inner();
	let conn = pool.get().expect("couldn't get db connection from pool");

	// use web::block to offload blocking Diesel code without blocking server thread
	let retailer = web::block(move || actions::find_retailer_by_id(r_id, &conn))
		.await
		.map_err(|e| {
			eprintln!("{}", e);
			HttpResponse::InternalServerError().finish()
		})?;

	if let Some(retailer) = retailer {
		Ok(HttpResponse::Ok().json(retailer))
	} else {
		let res = HttpResponse::NotFound()
			.body(format!("No reatailer found with uid: {}", r_id));
		Ok(res)
	}
}


/// Get ALL retailers (100 in the test DB)
#[get("/retailers")]
async fn get_retailers(
	pool: web::Data<DbPool>
) -> Result<HttpResponse, Error> {
	let conn = pool.get().expect("couldn't get db connection from pool");

	// use web::block to offload blocking Diesel code without blocking server thread
	let retailer = web::block(move || actions::get_all_retailers(&conn))
		.await
		.map_err(|e| {
			eprintln!("{}", e);
			HttpResponse::InternalServerError().finish()
		})?;

	if let Some(retailer) = retailer {
		Ok(HttpResponse::Ok().json(retailer))
	} else {
		let res = HttpResponse::NotFound()
			.body(format!("No retailers found."));
		Ok(res)
	}
}


#[get("/status")]
async fn get_status() -> Result<HttpResponse, Error> {
	Ok(HttpResponse::Ok().json(models::StatusMsg {
		status: 200,
		msg: String::from("Ok"),
	}))
}

/// Inserts new user with name defined in form.
// #[post("/user")]
// async fn add_user(
// 	pool: web::Data<DbPool>,
// 	form: web::Json<models::NewUser>,
// ) -> Result<HttpResponse, Error> {
// 	let conn = pool.get().expect("couldn't get db connection from pool");

// 	// use web::block to offload blocking Diesel code without blocking server thread
// 	let user = web::block(move || actions::insert_new_user(&form.name, &conn))
// 		.await
// 		.map_err(|e| {
// 			eprintln!("{}", e);
// 			HttpResponse::InternalServerError().finish()
// 		})?;

// 	Ok(HttpResponse::Ok().json(user))
// }

#[actix_rt::main]
async fn main() -> std::io::Result<()> {
	// std::env::set_var("RUST_LOG", "actix_web=info");
	// env_logger::init();
	dotenv::dotenv().ok();

	// set up database connection pool
	let connspec = std::env::var("DATABASE_URL").expect("DATABASE_URL");
	let manager = ConnectionManager::<PgConnection>::new(connspec);
	let pool = r2d2::Pool::builder()
		.build(manager)
		.expect("Failed to create pool.");

	let bind = "127.0.0.1:8000";

	println!("Starting server at:: {}", &bind);

	// Start HTTP server
	HttpServer::new(move || {
		App::new()
			// set up DB pool to be used with web::Data<Pool> extractor
			.data(pool.clone())
			// .wrap(middleware::Logger::default())
			.service(get_retailers)
			.service(get_retailer)
			.service(get_status)
	})
	.bind(&bind)?
	.run()
	.await
}
