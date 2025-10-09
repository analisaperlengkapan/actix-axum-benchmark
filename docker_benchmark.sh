#!/bin/bash

# Docker Benchmark Script
# Runs benchmarks in isolated Docker containers

echo "=== DOCKER ISOLATED BENCHMARK ==="
echo ""

# Function to run benchmark in Docker container
run_docker_benchmark() {
    local framework=$1
    local image_name="${framework}-benchmark"
    local container_name="${framework}-bench"

    # Determine port based on framework
    local port
    if [ "$framework" = "actix" ]; then
        port=8080
    else
        port=8081
    fi

    echo "Running $framework benchmark in Docker container..."

    # Run the container in detached mode
    docker run -d --name "$container_name" -p "$port:$port" "$image_name"

    echo "Testing $framework endpoints..."
    # Test basic functionality
    curl -s "http://localhost:$port/hello" > /dev/null
    if [ $? -eq 0 ]; then
        echo "✓ $framework hello endpoint working"
    else
        echo "✗ $framework hello endpoint failed"
    fi

    curl -s "http://localhost:$port/heavy" > /dev/null
    if [ $? -eq 0 ]; then
        echo "✓ $framework heavy endpoint working"
    else
        echo "✗ $framework heavy endpoint failed"
    fi

    # Run performance benchmarks
    echo "Running performance benchmarks for $framework..."

    # Light endpoint benchmark
    echo "Light endpoint benchmark:"
    wrk -t4 -c100 -d30s "http://localhost:$port/hello" > "docker_${framework}_light.txt" 2>&1

    # Heavy endpoint benchmark
    echo "Heavy endpoint benchmark:"
    wrk -t2 -c50 -d20s "http://localhost:$port/heavy" > "docker_${framework}_heavy.txt" 2>&1

    # Individual request timing
    echo "Individual request timing:"
    for i in {1..5}; do
        time curl -s "http://localhost:$port/hello" > /dev/null
    done > "docker_${framework}_individual.txt" 2>&1

    # Stop and remove container
    echo "Stopping $framework container..."
    docker stop "$container_name" > /dev/null 2>&1
    docker rm "$container_name" > /dev/null 2>&1

    echo "$framework benchmark completed"
    echo ""
}

# Clean up any existing containers
echo "Cleaning up existing containers..."
docker stop actix-bench axum-bench 2>/dev/null || true
docker rm actix-bench axum-bench 2>/dev/null || true

# Run benchmarks
run_docker_benchmark "actix"
run_docker_benchmark "axum"

echo "Docker benchmarks completed!"
echo "Results saved to:"
echo "  - docker_actix_light.txt"
echo "  - docker_actix_heavy.txt"
echo "  - docker_axum_light.txt"
echo "  - docker_axum_heavy.txt"
echo "  - docker_actix_individual.txt"
echo "  - docker_axum_individual.txt"
