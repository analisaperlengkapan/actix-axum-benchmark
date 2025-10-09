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

async fn cpu_intensive() -> Result<HttpResponse> {
    // CPU intensive task: Calculate fibonacci numbers
    fn fibonacci(n: u64) -> u64 {
        if n <= 1 {
            return n;
        }
        fibonacci(n - 1) + fibonacci(n - 2)
    }

    // Calculate multiple fibonacci numbers to increase CPU load
    let mut results = Vec::new();
    for i in 30..40 {  // Fibonacci numbers that require computation
        results.push(fibonacci(i));
    }

    let response = ApiResponse {
        message: format!("CPU intensive task completed. Results: {:?}", results),
        id: Uuid::new_v4().to_string(),
        timestamp: chrono::Utc::now().to_rfc3339(),
    };

    Ok(HttpResponse::Ok().json(response))
}

async fn ram_intensive() -> Result<HttpResponse> {
    // RAM intensive task: Allocate and process large amounts of data
    let mut large_vector = Vec::with_capacity(10_000_000); // ~40MB of data

    // Fill vector with data
    for i in 0..10_000_000 {
        large_vector.push(i as f64 * 3.14159);
    }

    // Process the data (simple operations to simulate work)
    let sum: f64 = large_vector.iter().sum();
    let avg = sum / large_vector.len() as f64;

    // Clear the vector to free memory
    drop(large_vector);

    let response = ApiResponse {
        message: format!("RAM intensive task completed. Sum: {}, Average: {}", sum, avg),
        id: Uuid::new_v4().to_string(),
        timestamp: chrono::Utc::now().to_rfc3339(),
    };

    Ok(HttpResponse::Ok().json(response))
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    println!("Starting Actix server on http://0.0.0.0:8080");

    HttpServer::new(|| {
        App::new()
            .route("/hello", web::get().to(hello))
            .route("/heavy", web::get().to(heavy))
            .route("/cpu", web::get().to(cpu_intensive))
            .route("/ram", web::get().to(ram_intensive))
    })
    .bind("0.0.0.0:8080")?
    .run()
    .await
}
