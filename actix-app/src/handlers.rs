use actix_web::{HttpResponse, Result, web};
use serde::Serialize;
use uuid::Uuid;

#[derive(Serialize)]
pub struct ApiResponse {
    pub message: String,
    pub id: String,
    pub timestamp: String,
}

pub async fn hello() -> Result<HttpResponse> {
    let response = ApiResponse {
        message: "Hello, World!".to_string(),
        id: Uuid::new_v4().to_string(),
        timestamp: chrono::Utc::now().to_rfc3339(),
    };

    Ok(HttpResponse::Ok().json(response))
}

pub async fn heavy() -> Result<HttpResponse> {
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

pub async fn cpu_intensive() -> Result<HttpResponse> {
    // Offload CPU intensive task to a thread pool
    let results = web::block(move || {
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
        results
    })
    .await
    .map_err(|e| actix_web::error::ErrorInternalServerError(format!("CPU task failed: {}", e)))?;

    let response = ApiResponse {
        message: format!("CPU intensive task completed. Results: {:?}", results),
        id: Uuid::new_v4().to_string(),
        timestamp: chrono::Utc::now().to_rfc3339(),
    };

    Ok(HttpResponse::Ok().json(response))
}

pub async fn ram_intensive() -> Result<HttpResponse> {
    // Offload RAM intensive task to a thread pool
    let (sum, avg) = web::block(move || {
        // RAM intensive task: Allocate and process large amounts of data
        let mut large_vector = Vec::with_capacity(10_000_000); // ~40MB of data

        // Fill vector with data
        for i in 0..10_000_000 {
            large_vector.push(i as f64 * std::f64::consts::PI);
        }

        // Process the data (simple operations to simulate work)
        let sum: f64 = large_vector.iter().sum();
        let avg = sum / large_vector.len() as f64;

        // Vector is dropped when function returns
        (sum, avg)
    })
    .await
    .map_err(|e| actix_web::error::ErrorInternalServerError(format!("RAM task failed: {}", e)))?;

    let response = ApiResponse {
        message: format!(
            "RAM intensive task completed. Sum: {}, Average: {}",
            sum, avg
        ),
        id: Uuid::new_v4().to_string(),
        timestamp: chrono::Utc::now().to_rfc3339(),
    };

    Ok(HttpResponse::Ok().json(response))
}
