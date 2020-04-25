use rocket_contrib::json::Json;
// use diesel::PgConnection;

use rocket_contrib::databases::diesel as condi;
#[database("postgres_local")]
struct RetailDB(condi::PgConnection);


// injects methods on modles, like .load / .limit etc.
use diesel::prelude::*;
// this is necessitating the `mod models` in main.rs, which in turn
// necessitates the `extern crate diesel` statement which 
use super::models::{StatusMsg, Retailer};
use super::schema::retailer::dsl::*;

// const LIMIT: u8 = 42;


/// The route only exists when type constraints are fulfilled!
/// e.g., /hello/Bernd/256 results in `404: Not Found` error
/// so does /hello/#/<age> ->> because of `#` as macro sign??
#[get("/hello/<name>/<age>")]
fn hello(name: String, age: u8) -> String {
	format!("Hello, {} year old named {}!", age, name)
}


#[get("/api")]
fn api_status() -> Json<StatusMsg> {
	Json(StatusMsg {
		status: 200,
		msg: String::from("API up and running."),
	})
}


#[get("/")]
fn root() -> Json<StatusMsg> {
	Json(StatusMsg {
		status: 200,
		msg: String::from("Rootsy bootsy."),
	})
}


#[get("/retailers")]
fn all(conn: RetailDB) -> Json<Vec<Retailer>> {
  let results = retailer
		// .limit(LIMIT as i64)
		.load::<Retailer>(&conn.0)
		.expect("Error loading retailers");
	
		Json(results)
}


#[get("/retailer/<r_id>")]
fn get_retailer(conn: RetailDB, r_id: i32) -> Json<Retailer> {
  let result = retailer
		.find(r_id).first(&conn.0)
    .expect("Error loading retailers");
	
		Json(result)
}


pub fn launch_rocket() {
  rocket::ignite()
    .attach(RetailDB::fairing())
		.mount("/", routes!
			[hello, api_status, root, all, get_retailer]
		)
		.launch();
}