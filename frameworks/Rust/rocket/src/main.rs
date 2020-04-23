#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;
#[macro_use]
extern crate rocket_contrib;
// #[macro_use]
extern crate diesel_codegen;

extern crate dotenv;
use dotenv::dotenv;
// use std::env;

// mod models;
mod schema;


#[database("pg_conn")]
struct RetailerDbConn(diesel::PgConnection);

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
    dotenv().ok();

    rocket::ignite()
        .attach(RetailerDbConn::fairing())
        .mount("/", routes![hello, api_status, root])
        .launch();
}
