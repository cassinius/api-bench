use rocket_contrib::json::Json;

// this is necessitating the `mod models` in main.rs, which in turn
// necessitates the `extern crate diesel` statement which 
use super::models::StatusMsg;

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