#!/bin/bash

# Start the network
function networkUp() {
  echo "Starting Hyperledger Fabric CA..."
  docker-compose  -f ../compose-files/fabric-ca/ca-orderers.yaml \
                  -f ../compose-files/fabric-ca/ca-peers-org1.yaml \
                  -f ../compose-files/fabric-ca/ca-peers-org2.yaml \
                  up -d
  if [ $? -ne 0 ]; then
    echo "Failed to start network."
    exit 1
  fi
  echo "Network started successfully."
}

# Stop the network
function networkDown() {
  echo "Stopping Hyperledger Fabric CA..."
  docker-compose  -f ../compose-files/fabric-ca/ca-orderers.yaml \
                  -f ../compose-files/fabric-ca/ca-peers-org1.yaml \
                  -f ../compose-files/fabric-ca/ca-peers-org2.yaml \
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
