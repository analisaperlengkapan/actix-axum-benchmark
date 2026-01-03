use axum::{Router, routing::get};
use tower::ServiceBuilder;
use tower_http::{cors::CorsLayer, trace::TraceLayer};

mod handlers;

#[tokio::main]
async fn main() {
    // Configure CORS
    let cors = CorsLayer::permissive();

    let app = Router::new()
        .route("/hello", get(handlers::hello))
        .route("/heavy", get(handlers::heavy))
        .route("/cpu", get(handlers::cpu_intensive))
        .route("/ram", get(handlers::ram_intensive))
        .layer(
            ServiceBuilder::new()
                .layer(TraceLayer::new_for_http())
                .layer(cors),
        );

    let listener = tokio::net::TcpListener::bind("0.0.0.0:8081")
        .await
        .expect("Failed to bind to address");

    println!("Starting Axum server on http://0.0.0.0:8081");

    axum::serve(listener, app)
        .await
        .expect("Server failed to start");
}
