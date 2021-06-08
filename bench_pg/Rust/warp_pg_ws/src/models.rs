use serde::Serialize;

#[derive(Serialize, Debug)]
pub struct Msg {
    pub status: Option<String>,
    pub msg: String,
}

#[allow(non_snake_case)]
#[derive(Serialize, Debug)]
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
