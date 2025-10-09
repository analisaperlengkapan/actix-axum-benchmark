#!/bin/bash

# Benchmark runner script
# Usage: ./run_benchmarks.sh [actix|axum] [light|heavy] [duration_seconds]

FRAMEWORK=$1
ENDPOINT_TYPE=$2
DURATION=${3:-60}
CONNECTIONS=${4:-100}
THREADS=${5:-4}

if [ -z "$FRAMEWORK" ] || [ -z "$ENDPOINT_TYPE" ]; then
    echo "Usage: $0 [actix|axum] [light|heavy] [duration_seconds] [connections] [threads]"
    echo "Example: $0 actix light 60 100 4"
    exit 1
fi

echo "Starting benchmark for $FRAMEWORK - $ENDPOINT_TYPE endpoint"
echo "Duration: $DURATION seconds"
echo "Connections: $CONNECTIONS"
echo "Threads: $THREADS"

# Determine port and endpoint
if [ "$FRAMEWORK" = "actix" ]; then
    PORT=8080
elif [ "$FRAMEWORK" = "axum" ]; then
    PORT=8081
else
    echo "Invalid framework: $FRAMEWORK"
    exit 1
fi

ENDPOINT=""
if [ "$ENDPOINT_TYPE" = "light" ]; then
    ENDPOINT="hello"
elif [ "$ENDPOINT_TYPE" = "heavy" ]; then
    ENDPOINT="heavy"
else
    echo "Invalid endpoint type: $ENDPOINT_TYPE"
    exit 1
fi

URL="http://127.0.0.1:$PORT/$ENDPOINT"

# Create results directory
RESULTS_DIR="results/${FRAMEWORK}_${ENDPOINT_TYPE}_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$RESULTS_DIR"

echo "Results will be saved to: $RESULTS_DIR"

# Start system monitoring in background
echo "Starting system monitoring..."
htop -b > "$RESULTS_DIR/htop_output.txt" 2>&1 &
HTOP_PID=$!

# Wait for server to be ready
echo "Waiting for server to be ready..."
sleep 3

# Run wrk benchmark
echo "Running wrk benchmark..."
wrk -t$THREADS -c$CONNECTIONS -d${DURATION}s --latency "$URL" > "$RESULTS_DIR/wrk_output.txt" 2>&1

# Kill htop
kill $HTOP_PID 2>/dev/null

# Also run hey for comparison
echo "Running hey benchmark..."
hey -n 10000 -c $CONNECTIONS "$URL" > "$RESULTS_DIR/hey_output.txt" 2>&1

# Collect system info
echo "Collecting system information..."
echo "=== System Information ===" > "$RESULTS_DIR/system_info.txt"
uname -a >> "$RESULTS_DIR/system_info.txt"
echo "" >> "$RESULTS_DIR/system_info.txt"
echo "=== CPU Information ===" >> "$RESULTS_DIR/system_info.txt"
lscpu >> "$RESULTS_DIR/system_info.txt"
echo "" >> "$RESULTS_DIR/system_info.txt"
echo "=== Memory Information ===" >> "$RESULTS_DIR/system_info.txt"
free -h >> "$RESULTS_DIR/system_info.txt"

echo "Benchmark complete!"
echo "Results saved to: $RESULTS_DIR"
