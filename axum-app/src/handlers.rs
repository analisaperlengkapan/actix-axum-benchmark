use axum::response::Json;
use chrono::Utc;
use serde::Serialize;
use uuid::Uuid;

#[derive(Serialize)]
pub struct ApiResponse {
    pub message: String,
    pub id: String,
    pub timestamp: String,
}

pub async fn hello() -> Json<ApiResponse> {
    Json(ApiResponse {
        message: "Hello, World!".to_string(),
        id: Uuid::new_v4().to_string(),
        timestamp: Utc::now().to_rfc3339(),
    })
}

pub async fn heavy() -> Json<Vec<ApiResponse>> {
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

pub async fn cpu_intensive() -> Json<ApiResponse> {
    // Offload CPU intensive task to a thread pool
    let results = tokio::task::spawn_blocking(move || {
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
    }).await.unwrap_or_else(|e| {
        eprintln!("CPU task failed: {}", e);
        vec![]
    });

    Json(ApiResponse {
        message: format!("CPU intensive task completed. Results: {:?}", results),
        id: Uuid::new_v4().to_string(),
        timestamp: Utc::now().to_rfc3339(),
    })
}

pub async fn ram_intensive() -> Json<ApiResponse> {
    // Offload RAM intensive task to a thread pool
    let (sum, avg) = tokio::task::spawn_blocking(move || {
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
    }).await.unwrap_or_else(|e| {
        eprintln!("RAM task failed: {}", e);
        (0.0, 0.0)
    });

    Json(ApiResponse {
        message: format!(
            "RAM intensive task completed. Sum: {}, Average: {}",
            sum, avg
        ),
        id: Uuid::new_v4().to_string(),
        timestamp: Utc::now().to_rfc3339(),
    })
}
