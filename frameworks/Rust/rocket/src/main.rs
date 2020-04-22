#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;
#[macro_use]
extern crate rocket_contrib;

use rocket_contrib::databases::diesel;

#[database("pg_conn")]
struct RetailerDbConn(diesel::PgConnection);

// OLD Rust (2015??)
// #[macro_use] extern crate rocket;
// use rocket::*;
// use diesel::prelude::*;
use diesel::{Queryable, Insertable};

use rocket_contrib::json::Json;
/// Needs `features = ["derive"]` in Cargo.toml
/// sometimes seems to need json_serde as well, or not, or yes,
/// depending on cargo's build mood (check with `cargo mood` ;-)
use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize, Debug)]
struct StatusMsg {
    status: u16,
    msg: String,
}

// mod schema;
// use super::schema::people;
#[derive(Queryable, Serialize, Deserialize)]
pub struct Retailer {
		pub id: i32,
		pub GSTIN: String,
		pub Business_name: String,
		pub Contact_person: String,
		pub Contact_number: i32,
		pub Contact_address: String,
		pub Contact_emailId: String,
		pub Status: String,
		pub Outlet_limit: i32,
}


/// The route only exists when type constraints are fulfilled!
/// e.g., /hello/Bernd/256 results in `404: Not Found` error
/// so does /hello/#/<age> ->> because of `#` as macro sign??
#[get("/hello/<name>/<age>")]
fn hello(name: String, age: u8) -> String {
    format!("Hello, {} year old named {}!", age, name)
}


#[get("/api")]
fn api_status() -> Json<StatusMsg> {
    let msg = StatusMsg {
        status: 200,
        msg: String::from("API up and running."),
    };
    Json(msg)
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
    rocket::ignite()
        .attach(RetailerDbConn::fairing())
        .mount("/", routes![hello, api_status, root])
        .launch();
}
