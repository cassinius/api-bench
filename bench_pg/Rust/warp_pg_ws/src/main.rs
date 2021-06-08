use serde_derive::Serialize;
use warp::Filter;

#[derive(Serialize)]
struct Msg {
    status: Option<String>,
    msg: String,
}

#[tokio::main]
async fn main() {
    let root = warp::path::end().map(|| {
        warp::reply::json(&Msg {
            status: None,
            msg: String::from("Server running at warp speed.....!"),
        })
    });

    let api_v1 = warp::path!("api" / "v1").map(|| {
        warp::reply::json(&Msg {
            status: Some(String::from("OK")),
            msg: String::from("API v1 up and running."),
        })
    });

    // GET /hello/warp => 200 OK with body "Hello, warp!"
    let hello = warp::path!("hello" / String).map(|name| format!("Hello, {}!", name));

    let routes = warp::get().and(root.or(api_v1).or(hello));

    warp::serve(routes).run(([127, 0, 0, 1], 8000)).await;
}
