#!/bin/bash
set -e

# Define Docker image name
DOCKER_IMAGE="lbg"

# Function to build the Docker image
build_docker() {
    echo "Building the Docker image..."
    sleep 3
    docker build -t $DOCKER_IMAGE .
}

# Cleanup previous build artifacts
cleanup() {
    echo "Cleaning up previous build artifacts..."
    sleep 3
    docker rm -f $(docker ps -aq) || true
    docker rmi -f $(docker images -q) || true
    echo "Cleanup done."
}

echo "Starting build process..."
sleep 3
cleanup
build_docker
echo "Build process completed successfully."
