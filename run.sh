#!/bin/bash
set -e

# Define Docker image name
DOCKER_IMAGE="lbg"

# Function to modify the application
modify_app() {
    echo "Modifying the application..."
    sleep 3
    export PORT=5001
    echo "Modifications done. Port is now set to $PORT"
}

# Function to run the Docker container
run_docker() {
    echo "Running Docker container..."
    sleep 3
    docker run -d -p 80:$PORT -e PORT=$PORT $DOCKER_IMAGE
}

echo "Starting application modification and container run process..."
sleep 3
modify_app
run_docker
echo "Container is running successfully."
