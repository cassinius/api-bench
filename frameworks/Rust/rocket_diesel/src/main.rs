extern crate dotenv;
use dotenv::dotenv;
use std::env;

// our own library...??
extern crate rocket_diesel;
use rocket_diesel::RetailerAPI;


fn main() {
	dotenv().ok();
	let db_url = env::var("DATABASE_URL").expect("DATABASE_URL must be set");
	println!("DB connection string: {:?}", db_url);
	RetailerAPI::new(db_url);
	RetailerAPI::api_start();
}
