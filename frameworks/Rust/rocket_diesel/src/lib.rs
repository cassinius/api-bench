#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use] extern crate diesel;
#[macro_use] extern crate rocket;
extern crate rocket_contrib;
use rocket_contrib::json::Json;

use diesel::PgConnection;
use diesel::prelude::*; // Without this, we can't use PgConnection::establish

mod schema;
use schema::retailer::dsl::*;

mod models;
use models::StatusMsg;
use models::Retailer;

mod routes;

pub struct RetailerAPI {
  db_conn: PgConnection
}


impl RetailerAPI {
  pub fn new(db_url: String) -> RetailerAPI {
    let db_conn = PgConnection::establish(&db_url).expect(&format!("Error connecting to {}", db_url));
    
    let results = retailer
									.limit(5)
									.load::<Retailer>(&db_conn)
									.expect("Error loading retailers");

    for r in results {
      println!("Business: {}, Contact person: {}", 
        r.Business_name.unwrap(), 
        r.Contact_person.unwrap());
    }
    
    RetailerAPI { db_conn }
  }


}
