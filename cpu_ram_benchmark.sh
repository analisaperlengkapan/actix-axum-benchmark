#!/bin/bash

# CPU and RAM Benchmark Script
# Tests CPU and RAM intensive endpoints with resource monitoring

echo "=== CPU & RAM BENCHMARK ==="
echo ""

# Function to run CPU/RAM benchmark in Docker container
run_resource_benchmark() {
    local framework=$1
    local endpoint_type=$2
    local image_name="${framework}-benchmark"
    local container_name="${framework}-resource-bench"

    # Determine port based on framework
    local port
    if [ "$framework" = "actix" ]; then
        port=8080
    else
        port=8081
    fi

    local endpoint
    local duration
    local connections
    local threads

    case $endpoint_type in
        "cpu")
            endpoint="/cpu"
            duration=30
            connections=20  # Lower concurrency for CPU intensive tasks
            threads=2
            ;;
        "ram")
            endpoint="/ram"
            duration=20
            connections=10  # Lower concurrency for RAM intensive tasks
            threads=1
            ;;
    esac

    echo "Running $framework $endpoint_type benchmark in Docker container..."
    echo "Endpoint: $endpoint, Duration: ${duration}s, Connections: $connections, Threads: $threads"

    # Run the container in detached mode
    docker run -d --name "$container_name" -p "$port:$port" "$image_name"

    # Wait for container to start
    sleep 5

    # Check if container is running
    if ! docker ps | grep -q "$container_name"; then
        echo "Failed to start $framework container"
        return 1
    fi

    # Test basic functionality
    echo "Testing $framework $endpoint_type endpoint..."
    curl -s "http://localhost:$port$endpoint" > /dev/null
    if [ $? -eq 0 ]; then
        echo "✓ $framework $endpoint_type endpoint working"
    else
        echo "✗ $framework $endpoint_type endpoint failed"
        docker stop "$container_name" > /dev/null 2>&1
        docker rm "$container_name" > /dev/null 2>&1
        return 1
    fi

    # Start resource monitoring in background
    echo "Starting resource monitoring..."
    docker stats "$container_name" --no-stream --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}" > "docker_${framework}_${endpoint_type}_stats.txt" 2>&1 &
    STATS_PID=$!

    # Run performance benchmarks
    echo "Running $endpoint_type performance benchmarks for $framework..."
    wrk -t$threads -c$connections -d${duration}s "http://localhost:$port$endpoint" > "docker_${framework}_${endpoint_type}_benchmark.txt" 2>&1

    # Stop monitoring
    kill $STATS_PID 2>/dev/null
    wait $STATS_PID 2>/dev/null

    # Stop and remove container
    echo "Stopping $framework container..."
    docker stop "$container_name" > /dev/null 2>&1
    docker rm "$container_name" > /dev/null 2>&1

    echo "$framework $endpoint_type benchmark completed"
    echo ""
}

# Clean up any existing containers
echo "Cleaning up existing containers..."
docker stop actix-resource-bench axum-resource-bench 2>/dev/null || true
docker rm actix-resource-bench axum-resource-bench 2>/dev/null || true

# Run CPU benchmarks
echo "=== CPU INTENSIVE BENCHMARKS ==="
run_resource_benchmark "actix" "cpu"
run_resource_benchmark "axum" "cpu"

# Run RAM benchmarks
echo "=== RAM INTENSIVE BENCHMARKS ==="
run_resource_benchmark "actix" "ram"
run_resource_benchmark "axum" "ram"

echo "CPU & RAM benchmarks completed!"
echo "Results saved to:"
echo "  - docker_actix_cpu_benchmark.txt"
echo "  - docker_actix_cpu_stats.txt"
echo "  - docker_axum_cpu_benchmark.txt"
echo "  - docker_axum_cpu_stats.txt"
echo "  - docker_actix_ram_benchmark.txt"
echo "  - docker_actix_ram_stats.txt"
echo "  - docker_axum_ram_benchmark.txt"
echo "  - docker_axum_ram_stats.txt"