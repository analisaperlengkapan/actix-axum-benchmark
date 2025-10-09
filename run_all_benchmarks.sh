#!/bin/bash

# Master benchmark script that runs all tests

echo "=== Actix vs Axum Performance Benchmark ==="
echo "Starting comprehensive benchmark suite..."

# Create results directory
RESULTS_DIR="results_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$RESULTS_DIR"

# Function to run benchmark for a specific configuration
run_benchmark() {
    local framework=$1
    local endpoint_type=$2
    local duration=${3:-30}

    echo "Running benchmark: $framework - $endpoint_type"

    # Start the server in background
    if [ "$framework" = "actix" ]; then
        cd actix-app
        cargo build --release
        ./target/release/actix-benchmark &
        SERVER_PID=$!
        SERVER_PORT=8080
    else
        cd axum-app
        cargo build --release
        ./target/release/axum-benchmark &
        SERVER_PID=$!
        SERVER_PORT=8081
    fi

    cd ..

    # Wait for server to start
    sleep 5

    # Run the benchmark
    ./benchmarks/run_benchmark.sh "$framework" "$endpoint_type" "$duration" 100 4

    # Stop the server
    kill $SERVER_PID 2>/dev/null
    wait $SERVER_PID 2>/dev/null

    echo "Completed benchmark: $framework - $endpoint_type"
    echo ""
}

# Run all benchmark combinations
echo "Running light endpoint benchmarks..."
run_benchmark "actix" "light" 30
run_benchmark "axum" "light" 30

echo "Running heavy endpoint benchmarks..."
run_benchmark "actix" "heavy" 30
run_benchmark "axum" "heavy" 30

# Run stress tests with higher load
echo "Running stress tests with higher load..."
run_benchmark "actix" "light" 60 200 8
run_benchmark "axum" "light" 60 200 8
run_benchmark "actix" "heavy" 60 200 8
run_benchmark "axum" "heavy" 60 200 8

echo "All benchmarks completed!"
echo "Results saved to: $RESULTS_DIR"
echo ""
echo "To view results:"
echo "  cd $RESULTS_DIR"
echo "  ls -la"
