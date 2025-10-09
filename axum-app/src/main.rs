use axum::{
    extract::Query,
    http::StatusCode,
    response::Json,
    routing::get,
    Router,
};
use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use tower::ServiceBuilder;
use tower_http::trace::TraceLayer;
use uuid::Uuid;

#[derive(Serialize)]
struct ApiResponse {
    message: String,
    id: String,
    timestamp: String,
}

async fn hello() -> Json<ApiResponse> {
    Json(ApiResponse {
        message: "Hello, World!".to_string(),
        id: Uuid::new_v4().to_string(),
        timestamp: Utc::now().to_rfc3339(),
    })
}

async fn heavy() -> Json<Vec<ApiResponse>> {
    // Generate a large response (approximately 1MB of JSON data)
    let large_data: Vec<ApiResponse> = (0..10000)
        .map(|i| ApiResponse {
            message: format!("Heavy response item {}", i),
            id: Uuid::new_v4().to_string(),
            timestamp: Utc::now().to_rfc3339(),
        })
        .collect();

    Json(large_data)
}

#[tokio::main]
async fn main() {
    let app = Router::new()
        .route("/hello", get(hello))
        .route("/heavy", get(heavy))
        .layer(ServiceBuilder::new().layer(TraceLayer::new_for_http()));

    let listener = tokio::net::TcpListener::bind("127.0.0.1:8081")
        .await
        .expect("Failed to bind to address");

    println!("Starting Axum server on http://127.0.0.1:8081");

    axum::serve(listener, app)
        .await
        .expect("Server failed to start");
}
