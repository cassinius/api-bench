use rocket_contrib::json::Json;
// use diesel::PgConnection;
use rocket_contrib::databases::diesel as condi;
#[database("postgres_local")]
struct RetailDB(condi::PgConnection);


// injects methods on modles, like .load / .limit etc.
use diesel::prelude::*;
// this is necessitating the `mod models` in main.rs, which in turn
// necessitates the `extern crate diesel` statement which 
use crate::models::{StatusMsg, Retailer};
use crate::schema::retailer::dsl::*;


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
fn get_retailers(conn: RetailDB) -> Json<Vec<Retailer>> {
  let results = retailer
		.load::<Retailer>(&conn.0)
		.expect("Error loading retailers");
	
		Json(results)
}


#[get("/retailer/<r_id>")]
fn get_retailer(conn: RetailDB, r_id: i32) -> Json<Retailer> {
  let result = retailer
		.find(r_id).first(&conn.0)
    .expect("Error loading retailer");
	
		Json(result)
}


pub fn launch_rocket() {
  rocket::ignite()
    .attach(RetailDB::fairing())
		.mount("/", routes!
			[root, api_status, get_retailers, get_retailer]
		)
		.launch();
}