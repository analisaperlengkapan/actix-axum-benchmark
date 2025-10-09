# Use the official Rust image as the base image
# Use the official Rust image as the base image
FROM rust:latest

# Install required packages for benchmarking tools
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    build-essential \
    libssl-dev \
    git \
    procps \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the Cargo.toml file
COPY Cargo.toml ./

# Copy the source code
COPY src ./src

# Build the application in release mode
RUN cargo build --release

# Expose the port the app runs on
EXPOSE 8081

# Command to run the application
CMD ["./target/release/axum-benchmark"]
