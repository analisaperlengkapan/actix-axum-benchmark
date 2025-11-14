# Actix vs Axum Performance Benchmark

This project provides a comprehensive performance comparison between two popular Rust web frameworks: **Actix** and **Axum**.

## Overview

The benchmark tests both frameworks with two types of API endpoints:
- **Light endpoints**: Simple "Hello, World!" responses
- **Heavy endpoints**: Large JSON responses (approximately 1MB)

Performance metrics measured:
- Response time
- Thr### Running Benchmarks

```bash
# Run all benchmarks (native execution)
./run_all_benchmarks.sh

# Run Docker container benchmarks (isolated environment)
./docker_benchmark.sh

# Run CPU & RAM intensive benchmarks
./cpu_ram_benchmark.sh

# Run specific benchmark
./benchmarks/run_benchmark.sh [actix|axum] [light|heavy] [duration] [connections] [threads]

# Example: Test Actix light endpoint for 60 seconds with 200 connections
./benchmarks/run_benchmark.sh actix light 60 200 8
```ts per second)
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
- `GET /cpu` - CPU intensive task (Fibonacci calculations)
- `GET /ram` - RAM intensive task (40MB data allocation and processing)

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
- `GET /cpu` - CPU intensive task (Fibonacci calculations)
- `GET /ram` - RAM intensive task (40MB data allocation and processing)

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

#### CPU Intensive Tests
- **Duration**: 30 seconds
- **Concurrency**: 20 connections
- **Threads**: 2 threads
- **Endpoint**: `/cpu` (Fibonacci calculations)
- **Resource Monitoring**: CPU and memory usage

#### RAM Intensive Tests
- **Duration**: 20 seconds
- **Concurrency**: 10 connections
- **Threads**: 1 thread
- **Endpoint**: `/ram` (40MB data allocation)
- **Resource Monitoring**: CPU and memory usage

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

## Docker Container Benchmarks

Recent benchmarks were conducted using Docker containers to provide isolated testing environment and ensure reproducible results.

### Docker Benchmark Results

#### Light Endpoint Performance (30s, 100 connections, 4 threads)

| Metric | Actix | Axum | Difference |
|--------|-------|------|------------|
| **Requests/sec** | 25,643 | 25,245 | -1.6% (Actix slightly faster) |
| **Latency (avg)** | 3.87ms | 3.96ms | +2.3% (Axum slightly slower) |
| **Total Requests** | 772,321 | 759,615 | -1.6% (Actix more requests) |
| **Transfer/sec** | 5.62MB | 5.54MB | -1.4% |

#### Heavy Endpoint Performance (20s, 50 connections, 2 threads)

| Metric | Actix | Axum | Difference |
|--------|-------|------|------------|
| **Requests/sec** | 103.50 | 93.79 | -9.4% (Actix faster) |
| **Latency (avg)** | 475.68ms | 525.41ms | +10.5% (Axum slower) |
| **Total Requests** | 2,078 | 1,881 | -9.5% (Actix more requests) |
| **Transfer/sec** | 131.17MB | 118.87MB | -9.4% |

#### Individual Request Response Times (Docker)

| Framework | Light Endpoint (/hello) | Heavy Endpoint (/heavy) |
|-----------|------------------------|------------------------|
| **Actix** | ~7-21ms | ~418ms |
| **Axum** | ~11-13ms | ~270ms |

*Note: Individual times measured using `time curl` in Docker environment*

### Docker vs Native Performance Comparison

The Docker container benchmarks show different performance characteristics compared to native execution:

- **Light endpoints**: Actix shows slight edge in Docker (25.6K vs 25.2K req/sec)
- **Heavy endpoints**: Actix significantly outperforms Axum in Docker (103.5 vs 93.8 req/sec)
- **Overall**: Docker introduces some overhead but provides consistent, reproducible results

### CPU & RAM Intensive Benchmarks

Recent benchmarks tested CPU and RAM intensive operations to evaluate framework performance under resource pressure.

#### CPU Intensive Performance (Fibonacci calculations, 30s, 20 connections, 2 threads)

| Metric | Actix | Axum | Difference |
|--------|-------|------|------------|
| **Requests/sec** | 2.83 | 2.36 | -16.6% (Actix faster) |
| **Latency (avg)** | 1.33s | 1.11s | -16.5% (Axum faster) |
| **CPU Usage** | 171.12% | 139.72% | +22.5% (Axum more efficient) |
| **Memory Usage** | 1.445MiB | 1020KiB | -29.4% (Axum more efficient) |
| **Total Requests** | 85 | 71 | -16.5% |

#### RAM Intensive Performance (40MB data allocation, 20s, 10 connections, 1 thread)

| Metric | Actix | Axum | Difference |
|--------|-------|------|------------|
| **Requests/sec** | 45.88 | 46.24 | +0.8% (Axum slightly faster) |
| **Latency (avg)** | 216.87ms | 214.83ms | -1.0% (Axum slightly faster) |
| **CPU Usage** | 140.17% | 188.91% | +34.8% (Actix more efficient) |
| **Memory Usage** | 96.43MiB | 103.7MiB | +7.5% (Actix more efficient) |
| **Total Requests** | 920 | 928 | +0.9% |

### Key CPU & RAM Benchmark Findings

1. **CPU Intensive Tasks**:
   - **Actix shows better throughput** (2.83 vs 2.36 req/sec) but higher latency
   - **Axum is more CPU efficient** (139.72% vs 171.12% CPU usage)
   - **Axum uses less memory** for CPU intensive operations

2. **RAM Intensive Tasks**:
   - **Very similar performance** between frameworks (45.88 vs 46.24 req/sec)
   - **Actix is more CPU efficient** (140.17% vs 188.91% CPU usage)
   - **Actix uses less memory** (96.43MiB vs 103.7MiB)

3. **Resource Efficiency**:
   - **CPU tasks**: Axum demonstrates better resource efficiency
   - **RAM tasks**: Actix shows slight edge in memory management
   - **Overall**: Both frameworks handle resource-intensive operations well

## Analysis

### Key Findings

1. **Native Performance Results** (Previous benchmarks):
   - **Light endpoints**: Both frameworks show sub-5ms response times
   - **Heavy endpoints**: Both handle ~1MB responses in under 15ms
   - **Axum demonstrated superior performance** in native execution

2. **Docker Container Performance** (Latest benchmarks):
   - **Light endpoints**: Actix shows slight advantage (25.6K vs 25.2K req/sec)
   - **Heavy endpoints**: Actix significantly outperforms Axum (103.5 vs 93.8 req/sec)
   - **Container overhead** reduces absolute performance but improves consistency

3. **CPU Intensive Operations**:
   - **Actix**: Better throughput (2.83 req/sec) but higher CPU usage (171.12%)
   - **Axum**: Lower latency (1.11s) and more CPU efficient (139.72%)
   - **Resource efficiency**: Axum shows better CPU utilization

4. **RAM Intensive Operations**:
   - **Similar throughput**: Both frameworks handle ~46 req/sec
   - **Actix**: More CPU efficient (140.17%) and lower memory usage (96.43MiB)
   - **Axum**: Slightly better latency (214.83ms) but higher resource usage

5. **Framework Characteristics**:
   - **Actix**: Mature, battle-tested framework with better Docker and RAM performance
   - **Axum**: Modern, ergonomic framework with excellent native and CPU efficiency

6. **Environment Impact**:
   - **Native execution**: Axum shows 8-17% better performance across scenarios
   - **Docker containers**: Actix shows 1-9% better performance, likely due to different runtime characteristics
   - **Resource intensive tasks**: Performance depends on specific workload characteristics

### Updated Recommendations

1. **For High-Performance Applications**:
   - **Native execution**: Axum recommended for best performance characteristics
   - **Containerized environments**: Actix shows better performance in Docker
   - Both frameworks are suitable for production workloads
   - Consider deployment environment when choosing framework

2. **For Development Experience**:
   - **Axum provides more intuitive** async/await patterns
   - **Actix offers extensive** middleware ecosystem
   - Choose based on team preferences and existing codebase

3. **For Containerized Deployments**:
   - **Actix performs better** in Docker environments
   - Consider Docker-specific optimizations for both frameworks
   - Test performance in target deployment environment

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

# For Docker benchmarks (optional)
# Install Docker and wrk load testing tool
sudo apt update && sudo apt install -y docker.io wrk
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
# Run all benchmarks (native execution)
./run_all_benchmarks.sh

# Run Docker container benchmarks (isolated environment)
./docker_benchmark.sh

# Run specific benchmark
./benchmarks/run_benchmark.sh [actix|axum] [light|heavy] [duration] [connections] [threads]

# Example: Test Actix light endpoint for 60 seconds with 200 connections
./benchmarks/run_benchmark.sh actix light 60 200 8
```

### Analyzing Results

```bash
# Generate results summary
./analyze_results.sh

# View Docker benchmark results
cat docker_actix_light.txt
cat docker_actix_heavy.txt
cat docker_axum_light.txt
cat docker_axum_heavy.txt

# View CPU & RAM benchmark results
cat docker_actix_cpu_benchmark.txt
cat docker_actix_cpu_stats.txt
cat docker_axum_cpu_benchmark.txt
cat docker_axum_cpu_stats.txt
cat docker_actix_ram_benchmark.txt
cat docker_actix_ram_stats.txt
cat docker_axum_ram_benchmark.txt
cat docker_axum_ram_stats.txt
```

## Future Improvements

1. **Additional Test Scenarios**:
   - Database integration tests
   - Authentication middleware tests
   - WebSocket performance tests
   - Container orchestration (Kubernetes) performance tests
   - I/O intensive operations (file system, network)

2. **More Comprehensive Metrics**:
   - Memory profiling with valgrind
   - CPU profiling with perf
   - Network I/O analysis
   - Container resource usage monitoring
   - Garbage collection analysis

3. **Different Hardware Configurations**:
   - Multi-core scaling tests
   - Different CPU architectures
   - Container vs bare-metal performance comparison
   - Cloud environment testing (AWS, GCP, Azure)

4. **Benchmarking Infrastructure**:
   - Automated CI/CD benchmarking pipelines
   - Historical performance tracking
   - Regression detection
   - Multi-environment comparison tools

5. **Resource-Specific Benchmarks**:
   - GPU-accelerated workloads
   - Disk I/O intensive operations
   - Network latency simulation
   - Memory pressure testing

Feel free to contribute by:
- Adding more test scenarios
- Improving benchmarking scripts
- Testing on different hardware configurations
- Adding more web frameworks for comparison

## CI/CD & Automation

This project includes automated workflows for continuous integration and weekly benchmarking:

### GitHub Actions Workflows

1. **Cargo Checks** (`.github/workflows/cargo-checks.yml`)
   - Runs on every push and pull request
   - Performs cargo check, clippy, fmt, test, and build
   - Ensures code quality and prevents regressions
   - Runs separately for actix-app and axum-app

2. **Weekly Benchmarks** (`.github/workflows/weekly-benchmark.yml`)
   - Scheduled to run every Monday at 00:00 UTC
   - Can be manually triggered via workflow_dispatch
   - Runs comprehensive benchmarks (standard, Docker, CPU/RAM)
   - Automatically creates a pull request with results
   - Generates detailed benchmark reports

3. **Security Audit** (`.github/workflows/security-audit.yml`)
   - Scheduled to run weekly on Mondays
   - Runs cargo-audit to check for vulnerabilities
   - Triggers on Cargo.toml/Cargo.lock changes
   - Performs additional checks with cargo-deny

### Dependabot Configuration

Automated dependency updates are configured in `.github/dependabot.yml`:
- Weekly checks for Cargo dependencies (Mondays)
- Separate monitoring for actix-app and axum-app
- Automatic pull requests for dependency updates
- Monitors GitHub Actions versions

### Running Workflows Manually

To manually trigger the weekly benchmark workflow:
1. Go to the Actions tab in GitHub
2. Select "Weekly Benchmark" workflow
3. Click "Run workflow"
4. Select the branch and confirm

## License

This benchmark project is provided as-is for educational and comparison purposes.
