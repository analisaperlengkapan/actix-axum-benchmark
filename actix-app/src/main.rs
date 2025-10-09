use actix_web::{web, App, HttpResponse, HttpServer, Result};
use serde::Serialize;
use uuid::Uuid;

#[derive(Serialize)]
struct ApiResponse {
    message: String,
    id: String,
    timestamp: String,
}

async fn hello() -> Result<HttpResponse> {
    let response = ApiResponse {
        message: "Hello, World!".to_string(),
        id: Uuid::new_v4().to_string(),
        timestamp: chrono::Utc::now().to_rfc3339(),
    };

    Ok(HttpResponse::Ok().json(response))
}

async fn heavy() -> Result<HttpResponse> {
    // Generate a large response (approximately 1MB of JSON data)
    let large_data: Vec<ApiResponse> = (0..10000)
        .map(|i| ApiResponse {
            message: format!("Heavy response item {}", i),
            id: Uuid::new_v4().to_string(),
            timestamp: chrono::Utc::now().to_rfc3339(),
        })
        .collect();

    Ok(HttpResponse::Ok().json(large_data))
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    println!("Starting Actix server on http://127.0.0.1:8080");

    HttpServer::new(|| {
        App::new()
            .route("/hello", web::get().to(hello))
            .route("/heavy", web::get().to(heavy))
    })
    .bind("127.0.0.1:8080")?
    .run()
    .await
}
