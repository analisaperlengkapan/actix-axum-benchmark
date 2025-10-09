#!/bin/bash

# Results analysis script

RESULTS_DIR="results_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$RESULTS_DIR"

echo "=== ACTIX vs AXUM BENCHMARK RESULTS ===" > "$RESULTS_DIR/benchmark_summary.md"
echo "" >> "$RESULTS_DIR/benchmark_summary.md"
echo "Generated on: $(date)" >> "$RESULTS_DIR/benchmark_summary.md"
echo "" >> "$RESULTS_DIR/benchmark_summary.md"

# Function to extract key metrics from wrk output
extract_metrics() {
    local file=$1
    if [ -f "$file" ]; then
        echo "## Results from $(basename $(dirname $file))" >> "$RESULTS_DIR/benchmark_summary.md"
        echo "" >> "$RESULTS_DIR/benchmark_summary.md"

        # Extract requests per second
        local rps=$(grep "Requests/sec" "$file" | awk '{print $2}')
        # Extract latency
        local latency=$(grep "Latency" "$file" | head -1 | awk '{print $2 " " $3}')
        # Extract total requests
        local total_reqs=$(grep "requests in" "$file" | awk '{print $1}')
        # Extract transfer rate
        local transfer_rate=$(grep "Transfer/sec" "$file" | awk '{print $2}')

        echo "**Requests/sec:** $rps" >> "$RESULTS_DIR/benchmark_summary.md"
        echo "**Average Latency:** $latency" >> "$RESULTS_DIR/benchmark_summary.md"
        echo "**Total Requests:** $total_reqs" >> "$RESULTS_DIR/benchmark_summary.md"
        echo "**Transfer Rate:** $transfer_rate" >> "$RESULTS_DIR/benchmark_summary.md"
        echo "" >> "$RESULTS_DIR/benchmark_summary.md"

        # Extract detailed latency percentiles
        echo "**Latency Distribution:**" >> "$RESULTS_DIR/benchmark_summary.md"
        grep -A 10 "Latency Distribution" "$file" >> "$RESULTS_DIR/benchmark_summary.md"
        echo "" >> "$RESULTS_DIR/benchmark_summary.md"
    fi
}

# Find all result directories and analyze them
find . -name "results" -type d | while read -r dir; do
    if [ -d "$dir" ]; then
        echo "Analyzing results in: $dir"
        echo "" >> "$RESULTS_DIR/benchmark_summary.md"
        echo "# Test Results: $(basename $dir)" >> "$RESULTS_DIR/benchmark_summary.md"
        echo "" >> "$RESULTS_DIR/benchmark_summary.md"

        # Analyze wrk results
        find "$dir" -name "wrk_output.txt" | while read -r wrk_file; do
            extract_metrics "$wrk_file"
        done

        # Analyze hey results
        find "$dir" -name "hey_output.txt" | while read -r hey_file; do
            if [ -f "$hey_file" ]; then
                echo "## Hey Results from $(basename $(dirname $hey_file))" >> "$RESULTS_DIR/benchmark_summary.md"
                echo "" >> "$RESULTS_DIR/benchmark_summary.md"
                echo '```' >> "$RESULTS_DIR/benchmark_summary.md"
                cat "$hey_file" >> "$RESULTS_DIR/benchmark_summary.md"
                echo '```' >> "$RESULTS_DIR/benchmark_summary.md"
                echo "" >> "$RESULTS_DIR/benchmark_summary.md"
            fi
        done
    fi
done

# System information summary
echo "# System Information" >> "$RESULTS_DIR/benchmark_summary.md"
echo "" >> "$RESULTS_DIR/benchmark_summary.md"
echo "**CPU:** $(lscpu | grep "Model name" | cut -d: -f2 | sed 's/^ *//')" >> "$RESULTS_DIR/benchmark_summary.md"
echo "**Cores:** $(nproc)" >> "$RESULTS_DIR/benchmark_summary.md"
echo "**Memory:** $(free -h | grep "^Mem:" | awk '{print $2}')" >> "$RESULTS_DIR/benchmark_summary.md"
echo "" >> "$RESULTS_DIR/benchmark_summary.md"

echo "Analysis complete! Summary saved to: $RESULTS_DIR/benchmark_summary.md"
