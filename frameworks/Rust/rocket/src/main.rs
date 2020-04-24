#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use] extern crate rocket;
// #[macro_use] 
extern crate rocket_contrib;
#[macro_use] extern crate diesel;

use diesel::PgConnection;
/// Without this, we can't use PgConnection::establish
use diesel::prelude::*;
extern crate dotenv;
use dotenv::dotenv;
use std::env;

mod models;
mod schema;

use models::StatusMsg;

use models::Retailer;
use schema::retailer::dsl::*;

// #[database("pg_conn")]
// struct RetailerDbConn(PgConnection);

use rocket_contrib::json::Json;


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


// #[get("/retailer/<id>")]
// fn get_retailer(conn: RetailerDbConn, id: usize) -> Result<Logs> {
// 		Retailer::by_id(&*conn, id)
// }


fn main() {
	dotenv().ok();
	let db_url = env::var("DATABASE_URL").expect("DATABASE_URL must be set");
	println!("{:?}", db_url);
	let conn = PgConnection::establish(&db_url).expect(&format!("Error connecting to {}", db_url));
	
	let results = retailer
									.limit(5)
									.load::<Retailer>(&conn)
									.expect("Error loading retailers");

	for r in results {
		println!("Business: {}, Contact person: {}", 
			r.Business_name.unwrap(), 
			r.Contact_person.unwrap());
	}

	// rocket::ignite()
	// 	// .attach(RetailerDbConn::fairing())
	// 	.mount("/", routes![hello, api_status, root])
	// 	.launch();
}
