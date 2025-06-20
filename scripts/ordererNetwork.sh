#!/bin/bash

# Start the network
function networkUp() {
  echo "Starting Hyperledger Fabric network..."
  docker-compose -f ../compose-files/orderers/orderers1-raft.yaml \
                 -f ../compose-files/orderers/orderers2-raft.yaml \
                 -f ../compose-files/orderers/orderers3-raft.yaml \
                 up -d
  if [ $? -ne 0 ]; then
    echo "Failed to start network."
    exit 1
  fi
  echo "Network started successfully."

  # Wait for 5 seconds to allow for the first load
  echo "Waiting for 5 seconds to allow services to initialize..."
  sleep 5
  echo "Waited for 5 seconds."
}

# Stop the network
function networkDown() {
  echo "Stopping Hyperledger Fabric network..."
  docker-compose  -f ../compose-files/orderers/orderers1-raft.yaml \
                  -f ../compose-files/orderers/orderers2-raft.yaml \
                  -f ../compose-files/orderers/orderers3-raft.yaml \
                 down --volumes --remove-orphans
  if [ $? -ne 0 ]; then
    echo "Failed to stop network."
    exit 1
  fi
  echo "Network stopped and cleaned up successfully."
}

# Parse command-line arguments
if [ "$1" == "up" ]; then
  networkUp
elif [ "$1" == "down" ]; then
  networkDown
else
  echo "Usage: $0 {up|down}"
  exit 1
fi
