@echo off
REM Minecraft Server 1.17.1 Startup Script for Windows
REM This script launches a vanilla Minecraft 1.17.1 server

REM Configuration
set SERVER_JAR=server.jar
set MAX_MEMORY=1024M
set MIN_MEMORY=512M
set JAVA_ARGS=-Xmx%MAX_MEMORY% -Xms%MIN_MEMORY% -XX:+UseG1GC -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:G1NewCollectionPercentage=30 -XX:G1MaxNewGenTaskPercent=40 -XX:InitiatingHeapOccupancyPercent=35 -XX:+DisableExplicitGC -XX:-OmitStackTraceInFastThrow

REM Check if server.jar exists
if not exist %SERVER_JAR% (
    echo Error: %SERVER_JAR% not found!
    echo Please download the Minecraft 1.17.1 server jar and place it in this directory.
    pause
    exit /b 1
)

REM Start the server
echo Starting Minecraft Server 1.17.1...
echo Max Memory: %MAX_MEMORY%
echo Min Memory: %MIN_MEMORY%
java %JAVA_ARGS% -jar %SERVER_JAR% nogui

pause
