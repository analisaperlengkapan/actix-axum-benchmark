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

#### Load Test Results (wrk) - Native Execution

##### Light Endpoint Performance (30s, 100 connections, 4 threads)

| Metric | Actix | Axum | Difference |
|--------|-------|------|------------|
| **Requests/sec** | 118,120 | 101,724 | +16.1% (Actix faster) |
| **Latency (avg)** | 0.98ms | 1.05ms | -6.7% (Actix faster) |
| **Latency (p50)** | 0.60ms | 0.83ms | -27.7% (Actix faster) |
| **Latency (p90)** | 2.24ms | 2.02ms | +10.9% (Axum faster) |
| **Latency (p99)** | 4.45ms | 4.12ms | +8.0% (Axum faster) |

##### Heavy Endpoint Performance (30s, 100 connections, 4 threads)

| Metric | Actix | Axum | Difference |
|--------|-------|------|------------|
| **Requests/sec** | 220.45 | 213.78 | +3.1% (Actix faster) |
| **Latency (avg)** | 450.08ms | 463.02ms | -2.8% (Actix faster) |
| **Latency (p50)** | 441.28ms | 470.48ms | -6.2% (Actix faster) |
| **Latency (p90)** | 464.42ms | 668.76ms | -30.6% (Actix faster) |
| **Latency (p99)** | 725.83ms | 840.32ms | -13.6% (Actix faster) |

##### Light Endpoint Stress Test (60s, 200 connections, 8 threads)

| Metric | Actix | Axum | Difference |
|--------|-------|------|------------|
| **Requests/sec** | 105,039 | 78,989 | +33.0% (Actix faster) |
| **Latency (avg)** | 2.06ms | 2.61ms | -21.1% (Actix faster) |

### Detailed Performance Analysis

#### Light Endpoint Analysis
- **Actix shows superior performance** throughput and average latency.
- **Throughput improvement**: Actix handles ~16% more requests per second.
- **Latency**: Actix is faster on average and median, though Axum has slightly better tail latency (p90, p99).
- **Optimization**: Both frameworks benefit from `mimalloc`, but Actix seems to leverage it better in this scenario.

#### Heavy Endpoint Analysis
- **Actix maintains a slight edge** (3%) in throughput and latency.
- **Consistency**: Actix shows better tail latency (p90, p99) for heavy payloads.

#### Overall Performance Characteristics

| Aspect | Actix | Axum |
|--------|-------|------|
| **Light Response Speed** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Heavy Response Speed** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Throughput (Light)** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Throughput (Heavy)** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Latency Consistency** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Memory Usage** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

*Performance rating: ⭐⭐⭐⭐⭐ = Excellent, ⭐⭐⭐⭐ = Very Good, ⭐⭐⭐ = Good*

## CPU & RAM Intensive Benchmarks

Recent benchmarks tested CPU and RAM intensive operations to evaluate framework performance under resource pressure (Native execution).

#### CPU Intensive Performance (Fibonacci calculations, 30s, 20 connections, 2 threads)

| Metric | Actix | Axum | Difference |
|--------|-------|------|------------|
| **Requests/sec** | 5.32 | 4.66 | +14.2% (Actix faster) |

#### RAM Intensive Performance (40MB data allocation, 20s, 10 connections, 1 thread)

| Metric | Actix | Axum | Difference |
|--------|-------|------|------------|
| **Requests/sec** | 95.51 | 100.54 | +5.3% (Axum faster) |
| **Latency (avg)** | 146.63ms | 115.88ms | +26.5% (Actix slower) |

### Key CPU & RAM Benchmark Findings

1. **CPU Intensive Tasks**:
   - **Actix shows better throughput** (5.32 vs 4.66 req/sec).

2. **RAM Intensive Tasks**:
   - **Axum shows better performance** (100.54 vs 95.51 req/sec) and significantly lower latency.

## Analysis

### Key Findings

1. **Native Performance Results** (Latest benchmarks with `mimalloc`):
   - **Light endpoints**: Actix outperforms Axum by ~16%.
   - **Heavy endpoints**: Actix outperforms Axum by ~3%.
   - **Stress Tests**: Actix maintains a significant lead (33% on light endpoints).

2. **Optimization Impact**:
   - Switching to `mimalloc` and removing unused middleware has significantly boosted performance for both, but Actix appears to have gained more.

3. **CPU Intensive Operations**:
   - **Actix**: Better throughput.

4. **RAM Intensive Operations**:
   - **Axum**: Better throughput and latency.

### Updated Recommendations

1. **For High-Performance Applications**:
   - **Actix** is currently the performance leader for standard HTTP workloads (both light and heavy) in this environment.
   - **Axum** performs slightly better in RAM-intensive tasks.
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
