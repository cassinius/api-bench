use actix_web::{get, web, App, HttpRequest, HttpResponse, HttpServer, Responder};
use listenfd::ListenFd;

const PORT: u16 = 8000;

async fn greet(req: HttpRequest) -> impl Responder {
    let name = req.match_info().get("name").unwrap_or("World");
    format!("Hello {}!", &name)
}


#[get("/ping")]
async fn ping() -> impl Responder {
    HttpResponse::Ok().body("Pong!")
}


#[actix_rt::main]
async fn main() -> std::io::Result<()> {
    let mut listenfd = ListenFd::from_env();
    let mut server = HttpServer::new(|| {
        App::new()
            .route("/greet", web::get().to(greet))
            .route("/greet/{name}", web::get().to(greet))
            .service(ping)
    });

    server = if let Some(l) = listenfd.take_tcp_listener(0).unwrap() {
        server.listen(l)?
    } else {
        server.bind(format!("127.0.0.1:{}", PORT))?
    };

    server.run().await

    // .bind("127.0.0.1:8000")?
    // .run()
    // .await
}
