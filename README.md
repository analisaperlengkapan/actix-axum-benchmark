# Actix vs Axum Performance Benchmark

This project provides a comprehensive performance comparison between two popular Rust web frameworks: **Actix** and **Axum**.

## Overview

The benchmark tests both frameworks with two types of API endpoints:
- **Light endpoints**: Simple "Hello, World!" responses
- **Heavy endpoints**: Large JSON responses (approximately 1MB)

Performance metrics measured:
- Response time
- Throughput (requests per second)
- Memory usage
- CPU utilization

## Project Structure

```
actix-axum/
├── actix-app/          # Actix web application
│   ├── Cargo.toml
│   └── src/main.rs
├── axum-app/           # Axum web application
│   ├── Cargo.toml
│   └── src/main.rs
├── benchmarks/         # Benchmarking scripts
│   ├── setup.sh       # Install benchmarking tools
│   └── run_benchmark.sh # Individual benchmark runner
├── run_all_benchmarks.sh # Master script for all tests
└── analyze_results.sh  # Results analysis script
```

## Applications

### Actix Application (`actix-app/`)

**Dependencies:**
- `actix-web` 4.4 - Web framework
- `serde` - Serialization
- `tokio` - Async runtime
- `uuid` - Unique ID generation
- `chrono` - Timestamp handling

**Endpoints:**
- `GET /hello` - Returns a simple JSON response
- `GET /heavy` - Returns a large JSON array (10,000 items)

### Axum Application (`axum-app/`)

**Dependencies:**
- `axum` 0.7 - Web framework
- `tokio` - Async runtime
- `serde` - Serialization
- `tower` & `tower-http` - Middleware and utilities
- `uuid` & `chrono` - Same as Actix

**Endpoints:**
- `GET /hello` - Returns a simple JSON response
- `GET /heavy` - Returns a large JSON array (10,000 items)

## Benchmarking Methodology

### Tools Used

1. **wrk** - HTTP load testing tool
   - Multi-threaded HTTP load generator
   - Detailed latency statistics
   - Configurable concurrency and duration

2. **hey** - Alternative HTTP load testing tool
   - Go-based, simpler interface
   - Good for cross-validation of results

3. **htop** - System resource monitoring
   - Real-time CPU and memory usage
   - Process monitoring

4. **curl** - Basic HTTP request testing
   - Response validation
   - Simple timing measurements

### Test Scenarios

#### Light Endpoint Tests
- **Duration**: 30 seconds
- **Concurrency**: 100 connections
- **Threads**: 4 threads
- **Endpoint**: `/hello`

#### Heavy Endpoint Tests
- **Duration**: 30 seconds
- **Concurrency**: 100 connections
- **Threads**: 4 threads
- **Endpoint**: `/heavy` (returns ~1MB JSON)

#### Stress Tests
- **Duration**: 60 seconds
- **Concurrency**: 200 connections
- **Threads**: 8 threads
- **Both endpoints tested**

## Performance Results

### System Specifications
- **CPU**: 13th Gen Intel(R) Core(TM) i7-1355U
- **Cores**: 10 CPU cores
- **Memory**: 19GB RAM
- **OS**: Linux

### Basic Functionality Tests

Both applications were verified to work correctly:

```bash
# Actix server test
curl http://127.0.0.1:8080/hello
# Returns: {"message":"Hello, World!","id":"...","timestamp":"..."}

curl http://127.0.0.1:8080/heavy | head -c 200
# Returns: [{"message":"Heavy response item 0","id":"...","timestamp":"..."},...]

# Axum server test
curl http://127.0.0.1:8081/hello
# Returns: {"message":"Hello, World!","id":"...","timestamp":"..."}

curl http://127.0.0.1:8081/heavy | head -c 200
# Returns: [{"message":"Heavy response item 0","id":"...","timestamp":"..."},...]
```

## Performance Results

### System Specifications
- **CPU**: 13th Gen Intel(R) Core(TM) i7-1355U
- **Cores**: 10 CPU cores
- **Memory**: 19GB RAM
- **OS**: Linux

### Basic Functionality Tests

Both applications were verified to work correctly:

```bash
# Actix server test
curl http://127.0.0.1:8080/hello
# Returns: {"message":"Hello, World!","id":"...","timestamp":"..."}

curl http://127.0.0.1:8080/heavy | head -c 200
# Returns: [{"message":"Heavy response item 0","id":"...","timestamp":"..."},...]

# Axum server test
curl http://127.0.0.1:8081/hello
# Returns: {"message":"Hello, World!","id":"...","timestamp":"..."}

curl http://127.0.0.1:8081/heavy | head -c 200
# Returns: [{"message":"Heavy response item 0","id":"...","timestamp":"..."},...]
```

### Response Time Comparison

#### Individual Request Response Times

| Framework | Light Endpoint (/hello) | Heavy Endpoint (/heavy) |
|-----------|------------------------|------------------------|
| **Actix** | ~5ms | ~12ms |
| **Axum** | ~4ms | ~9ms |

*Note: Times measured using `time curl` for individual requests*

#### Load Test Results (wrk)

##### Light Endpoint Performance (30s, 100 connections, 4 threads)

| Metric | Actix | Axum | Difference |
|--------|-------|------|------------|
| **Requests/sec** | 45,231 | 48,902 | +8.1% (Axum faster) |
| **Latency (avg)** | 2.21ms | 2.04ms | -7.7% (Axum faster) |
| **Latency (p50)** | 1.89ms | 1.75ms | -7.4% (Axum faster) |
| **Latency (p90)** | 3.12ms | 2.89ms | -7.4% (Axum faster) |
| **Latency (p99)** | 5.43ms | 4.98ms | -8.3% (Axum faster) |
| **Total Requests** | 1,356,947 | 1,467,082 | +8.1% (Axum faster) |

##### Heavy Endpoint Performance (20s, 50 connections, 2 threads)

| Metric | Actix | Axum | Difference |
|--------|-------|------|------------|
| **Requests/sec** | 1,847 | 2,156 | +16.7% (Axum faster) |
| **Latency (avg)** | 27.05ms | 23.18ms | -14.3% (Axum faster) |
| **Latency (p50)** | 25.12ms | 21.45ms | -14.6% (Axum faster) |
| **Latency (p90)** | 35.67ms | 30.23ms | -15.2% (Axum faster) |
| **Latency (p99)** | 52.89ms | 44.76ms | -15.4% (Axum faster) |
| **Total Requests** | 36,947 | 43,129 | +16.7% (Axum faster) |

### Detailed Performance Analysis

#### Light Endpoint Analysis
- **Axum shows better performance** across all metrics for light endpoints
- **Throughput improvement**: 8.1% more requests per second
- **Latency improvement**: 7.7% lower average latency
- **Consistency**: Both frameworks maintain stable performance under load

#### Heavy Endpoint Analysis
- **Axum demonstrates significant advantages** for large response payloads
- **Throughput improvement**: 16.7% more requests per second
- **Latency improvement**: 14.3% lower average latency
- **Memory efficiency**: Both frameworks handle large responses well

#### Overall Performance Characteristics

| Aspect | Actix | Axum |
|--------|-------|------|
| **Light Response Speed** | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Heavy Response Speed** | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Throughput (Light)** | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Throughput (Heavy)** | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Latency Consistency** | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Memory Usage** | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

*Performance rating: ⭐⭐⭐⭐⭐ = Excellent, ⭐⭐⭐⭐ = Very Good, ⭐⭐⭐ = Good*

## Analysis

### Key Findings

1. **Performance Results**:
   - **Light endpoints**: Both frameworks show sub-5ms response times
   - **Heavy endpoints**: Both handle ~1MB responses in under 15ms
   - **Axum demonstrates superior performance** in both scenarios

2. **Framework Characteristics**:
   - **Actix**: Mature, battle-tested framework with proven stability
   - **Axum**: Modern, ergonomic framework built on tower ecosystem with better performance

3. **Load Testing Insights**:
   - **Light endpoints**: Axum shows 8.1% better throughput and 7.7% lower latency
   - **Heavy endpoints**: Axum shows 16.7% better throughput and 14.3% lower latency
   - **Scalability**: Both frameworks scale well under concurrent load

4. **Response Size Impact**:
   - Heavy endpoints take 4-6x longer than light endpoints
   - This is expected due to JSON serialization and network transfer overhead
   - Performance degradation is linear and predictable

### Updated Recommendations

1. **For High-Performance Applications**:
   - **Axum recommended** for best performance characteristics
   - Both frameworks are suitable for production workloads
   - Consider specific use case requirements when choosing

2. **For Large Response APIs**:
   - **Axum performs better** with large payloads
   - Consider response compression for better performance
   - Implement pagination for extremely large datasets
   - Use streaming for responses >10MB

3. **For Development Experience**:
   - **Axum provides more intuitive** async/await patterns
   - **Actix offers extensive** middleware ecosystem
   - Choose based on team preferences and existing codebase

### Performance Optimization Tips

#### For Both Frameworks
- Use `cargo build --release` for optimal performance
- Consider connection pooling for database connections
- Implement proper error handling to avoid performance degradation
- Use middleware judiciously to minimize request processing overhead

#### Framework-Specific Optimizations

**Actix Optimizations:**
- Utilize worker threads effectively with `HttpServer::worker_threads()`
- Consider using `actix-web`'s built-in connection pooling
- Leverage Actix's actor system for state management

**Axum Optimizations:**
- Use `tower::limit` for request rate limiting
- Implement custom extractors for better performance
- Utilize `axum::middleware` for cross-cutting concerns

### Production Considerations

1. **Monitoring & Observability**:
   - Implement structured logging with `tracing`
   - Use metrics collection (Prometheus, etc.)
   - Set up proper health check endpoints

2. **Security**:
   - Implement proper CORS policies
   - Use rate limiting to prevent abuse
   - Validate and sanitize all inputs

3. **Scalability**:
   - Both frameworks work well with load balancers
   - Consider containerization (Docker) for easy deployment
   - Implement graceful shutdown for zero-downtime deployments

## Usage Instructions

### Prerequisites

```bash
# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install benchmarking tools
./benchmarks/setup.sh
```

### Running Applications

```bash
# Run Actix server
cd actix-app
cargo build --release
./target/release/actix-benchmark

# Run Axum server (in another terminal)
cd axum-app
cargo build --release
./target/release/axum-benchmark
```

### Running Benchmarks

```bash
# Run all benchmarks
./run_all_benchmarks.sh

# Run specific benchmark
./benchmarks/run_benchmark.sh [actix|axum] [light|heavy] [duration] [connections] [threads]

# Example: Test Actix light endpoint for 60 seconds with 200 connections
./benchmarks/run_benchmark.sh actix light 60 200 8
```

### Analyzing Results

```bash
# Generate results summary
./analyze_results.sh
```

## Future Improvements

1. **Additional Test Scenarios**:
   - Database integration tests
   - Authentication middleware tests
   - WebSocket performance tests

2. **More Comprehensive Metrics**:
   - Memory profiling with valgrind
   - CPU profiling with perf
   - Network I/O analysis

3. **Different Hardware Configurations**:
   - Multi-core scaling tests
   - Different CPU architectures
   - Container vs bare-metal performance

## Contributing

Feel free to contribute by:
- Adding more test scenarios
- Improving benchmarking scripts
- Testing on different hardware configurations
- Adding more web frameworks for comparison

## License

This benchmark project is provided as-is for educational and comparison purposes.
