#![feature(proc_macro_hygiene, decl_macro)]
// ^^ this is needed here in `lib.rs` to make the 
// route (`get`) macros work in `routes.rs` ...

#[macro_use] extern crate diesel;
#[macro_use] extern crate rocket;
#[macro_use] extern crate rocket_contrib; // for the database macro...

use diesel::PgConnection;
use diesel::prelude::*; // Without this, we can't use PgConnection::establish

mod schema;
use schema::retailer::dsl::*;

mod models;
use models::Retailer;

mod routes;

pub struct RetailerAPI {
  db_conn: PgConnection
}


impl RetailerAPI {
  pub fn new(db_url: String) -> RetailerAPI {
    let db_conn = PgConnection::establish(&db_url).expect(&format!("Error connecting to {}", db_url));    
    RetailerAPI { db_conn }
  }


  pub fn control_output(&self) {
    let results = retailer
      .limit(5)
      .load::<Retailer>(&self.db_conn)
      .expect("Error loading retailers");

    for r in results {
      println!("Business: {}, Contact person: {}", 
      r.Business_name.unwrap(), 
      r.Contact_person.unwrap());
    }
  }
  

  pub fn api_start() {
    routes::launch_rocket();
  }

}
