#![feature(proc_macro_hygiene, decl_macro)]
#[macro_use]
extern crate rocket;
#[macro_use]
extern crate rocket_contrib;

use std::io::Cursor;

use rocket::http::ContentType;
use rocket::request::Request;
use rocket::response::{self, Responder, Response};

use rocket_contrib::databases::redis::{self, Commands};

#[database("retailer_db")]
struct RetailerDbConn(redis::Connection);

#[allow(non_snake_case)]
struct Retailer {
    pub id: String,
    pub GSTIN: String,
    pub Business_name: String,
    // pub Contact_person: String,
    // pub Contact_number: i32,
    // pub Contact_address: String,
    // pub Contact_emailId: String,
    // pub Status: String,
    // pub Outlet_limit: i32,
}

impl<'r> Responder<'r> for Retailer {
    fn respond_to(self, _: &Request) -> response::Result<'r> {
        Response::build()
            .sized_body(Cursor::new(format!("{}", self.Business_name)))
            .header(ContentType::new("text", "plain"))
            .ok()
    }
}

#[get("/")]
fn api() -> String {
    String::from("Rocket Retailer API up and running.")
}

#[get("/retailers")]
fn retailers(conn: RetailerDbConn) -> String {
    String::from("Retailers!")
}

#[get("/retailer/<id>")]
fn retailer(conn: RetailerDbConn, id: String) -> Option<String> {
    // Option<Retailer>
    match conn.get(id) {
        Ok(value) => value,
        Err(_e) => None,
    }
}

fn main() {
    rocket::ignite()
        .attach(RetailerDbConn::fairing())
        .mount("/", rocket::routes![api, retailers, retailer])
        .launch();
}
