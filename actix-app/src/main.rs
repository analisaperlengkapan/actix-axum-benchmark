use actix_cors::Cors;
use actix_web::{web, App, HttpServer};

mod handlers;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    println!("Starting Actix server on http://0.0.0.0:8080");

    HttpServer::new(|| {
        let cors = Cors::permissive();

        App::new()
            .wrap(cors)
            .route("/hello", web::get().to(handlers::hello))
            .route("/heavy", web::get().to(handlers::heavy))
            .route("/cpu", web::get().to(handlers::cpu_intensive))
            .route("/ram", web::get().to(handlers::ram_intensive))
    })
    .bind("0.0.0.0:8080")?
    .run()
    .await
}
