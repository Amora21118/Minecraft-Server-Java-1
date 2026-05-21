#!/bin/bash
# Minecraft Server 1.17.1 Startup Script for Linux/macOS
# This script launches a vanilla Minecraft 1.17.1 server

# Configuration
SERVER_JAR="server.jar"
MAX_MEMORY="1024M"
MIN_MEMORY="512M"
JAVA_ARGS="-Xmx${MAX_MEMORY} -Xms${MIN_MEMORY} -XX:+UseG1GC -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:G1NewCollectionPercentage=30 -XX:G1MaxNewGenTaskPercent=40 -XX:InitiatingHeapOccupancyPercent=35 -XX:+DisableExplicitGC -XX:-OmitStackTraceInFastThrow"

# Check if java is installed
if ! command -v java &> /dev/null; then
    echo "Error: Java is not installed!"
    echo "Please install Java 16 or higher from https://www.oracle.com/java/technologies/downloads/"
    exit 1
fi

# Check if server.jar exists
if [ ! -f "$SERVER_JAR" ]; then
    echo "Error: $SERVER_JAR not found!"
    echo "Downloading Minecraft 1.17.1 server..."
    curl -o "$SERVER_JAR" "https://piston-data.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar"
    
    if [ ! -f "$SERVER_JAR" ]; then
        echo "Download failed! Please download manually from:"
        echo "https://piston-data.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar"
        exit 1
    fi
fi

# Start the server
echo "Starting Minecraft Server 1.17.1..."
echo "Max Memory: $MAX_MEMORY"
echo "Min Memory: $MIN_MEMORY"
java $JAVA_ARGS -jar "$SERVER_JAR" nogui
