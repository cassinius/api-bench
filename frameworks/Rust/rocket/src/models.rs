use diesel;
use diesel::prelude::*;
use diesel::pg::PgConnection;
use serde::{Deserialize, Serialize};


use schema::retailer;


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

