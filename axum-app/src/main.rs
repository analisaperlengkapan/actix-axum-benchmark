use axum::{Router, response::Json, routing::get};
use chrono::Utc;
use serde::Serialize;
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

async fn cpu_intensive() -> Json<ApiResponse> {
    // CPU intensive task: Calculate fibonacci numbers
    fn fibonacci(n: u64) -> u64 {
        if n <= 1 {
            return n;
        }
        fibonacci(n - 1) + fibonacci(n - 2)
    }

    // Calculate multiple fibonacci numbers to increase CPU load
    let mut results = Vec::new();
    for i in 30..40 {
        // Fibonacci numbers that require computation
        results.push(fibonacci(i));
    }

    Json(ApiResponse {
        message: format!("CPU intensive task completed. Results: {:?}", results),
        id: Uuid::new_v4().to_string(),
        timestamp: Utc::now().to_rfc3339(),
    })
}

async fn ram_intensive() -> Json<ApiResponse> {
    // RAM intensive task: Allocate and process large amounts of data
    let mut large_vector = Vec::with_capacity(10_000_000); // ~40MB of data

    // Fill vector with data
    for i in 0..10_000_000 {
        large_vector.push(i as f64 * std::f64::consts::PI);
    }

    // Process the data (simple operations to simulate work)
    let sum: f64 = large_vector.iter().sum();
    let avg = sum / large_vector.len() as f64;

    // Clear the vector to free memory
    drop(large_vector);

    Json(ApiResponse {
        message: format!(
            "RAM intensive task completed. Sum: {}, Average: {}",
            sum, avg
        ),
        id: Uuid::new_v4().to_string(),
        timestamp: Utc::now().to_rfc3339(),
    })
}

#[tokio::main]
async fn main() {
    let app = Router::new()
        .route("/hello", get(hello))
        .route("/heavy", get(heavy))
        .route("/cpu", get(cpu_intensive))
        .route("/ram", get(ram_intensive))
        .layer(ServiceBuilder::new().layer(TraceLayer::new_for_http()));

    let listener = tokio::net::TcpListener::bind("0.0.0.0:8081")
        .await
        .expect("Failed to bind to address");

    println!("Starting Axum server on http://0.0.0.0:8081");

    axum::serve(listener, app)
        .await
        .expect("Server failed to start");
}
