#!/bin/bash

# Setup script for benchmarking tools
echo "Setting up benchmarking tools..."

# Install wrk (HTTP benchmarking tool)
if ! command -v wrk &> /dev/null; then
    echo "Installing wrk..."
    sudo apt-get update
    sudo apt-get install -y build-essential libssl-dev git
    git clone https://github.com/wg/wrk.git
    cd wrk
    make
    sudo cp wrk /usr/local/bin/
    cd ..
    rm -rf wrk
else
    echo "wrk already installed"
fi

# Install hey (alternative to wrk, written in Go)
if ! command -v hey &> /dev/null; then
    echo "Installing hey..."
    wget https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64
    chmod +x hey_linux_amd64
    sudo mv hey_linux_amd64 /usr/local/bin/hey
else
    echo "hey already installed"
fi

# Install htop for system monitoring
if ! command -v htop &> /dev/null; then
    echo "Installing htop..."
    sudo apt-get install -y htop
else
    echo "htop already installed"
fi

echo "Setup complete!"
