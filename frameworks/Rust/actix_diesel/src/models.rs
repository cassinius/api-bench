use serde::{Deserialize, Serialize};

use crate::schema::{users};

#[derive(Debug, Clone, Serialize, Queryable, Insertable)]
pub struct User {
    pub id: String,
    pub name: String,
}


#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct NewUser {
    pub name: String,
}


#[derive(Serialize, Deserialize, Debug)]
pub struct StatusMsg {
    pub status: u16,
    pub msg: String,
}


#[allow(non_snake_case)]
#[derive(Serialize, Queryable, Debug)]
pub struct Retailer {
    pub id: i32,
    pub GSTIN: Option<String>,
    pub Business_name: Option<String>,
    pub Contact_person: Option<String>,
    pub Contact_number: Option<i32>,
    pub Contact_address: Option<String>,
    pub Contact_emailId: Option<String>,
    pub Status: Option<String>,
    pub Outlet_limit: Option<i32>,
}
