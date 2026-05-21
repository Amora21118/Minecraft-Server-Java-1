# Minecraft Server 1.17.1 Vanilla

A complete setup guide for running a Minecraft 1.17.1 vanilla server with GitHub Codespaces support.

---

## 📋 Table of Contents

1. [Quick Start](#quick-start)
2. [Prerequisites](#prerequisites)
3. [Step-by-Step Installation](#step-by-step-installation)
4. [Running the Server](#running-the-server)
5. [GitHub Codespaces Setup](#github-codespaces-setup)
6. [Server Configuration](#server-configuration)
7. [Troubleshooting](#troubleshooting)
8. [Server Commands](#server-commands)

---

## 🚀 Quick Start

**For experienced users:**

```bash
# 1. Clone the repository
git clone https://github.com/Amora21118/Minecraft-Server-Java-1.git
cd Minecraft-Server-Java-1

# 2. Download server.jar (see step 2 below)

# 3. Run the server
./start.sh          # Linux/macOS
start.bat           # Windows
```

---

## ✅ Prerequisites

Before starting, ensure you have:

- **Java 16 or higher** installed
  - Download: https://www.oracle.com/java/technologies/downloads/
  - Verify: `java -version`
  
- **Git** installed
  - Download: https://git-scm.com/

- **At least 2GB of free disk space** for the server

- **GitHub account** (for Codespaces support)

---

## 📝 Step-by-Step Installation

### Step 1: Clone or Download the Repository

**Option A - Using Git (Recommended):**
```bash
git clone https://github.com/Amora21118/Minecraft-Server-Java-1.git
cd Minecraft-Server-Java-1
```

**Option B - Download as ZIP:**
1. Go to https://github.com/Amora21118/Minecraft-Server-Java-1
2. Click **Code** → **Download ZIP**
3. Extract the folder
4. Open terminal in the extracted folder

---

### Step 2: Download the Minecraft Server JAR

The official Minecraft 1.17.1 server jar is required.

**Automatic Download (Recommended):**
```bash
# Linux/macOS
curl -o server.jar https://launcher.mojang.com/v1/objects/e00c4052dac1d59ffd4cb3442cffafb3b4987b1a/server.jar

# Windows (PowerShell)
Invoke-WebRequest -Uri "https://launcher.mojang.com/v1/objects/e00c4052dac1d59ffd4cb3442cffafb3b4987b1a/server.jar" -OutFile "server.jar"
```

**Manual Download:**
1. Visit: https://launcher.mojang.com/v1/objects/e00c4052dac1d59ffd4cb3442cffafb3b4987b1a/server.jar
2. Save as `server.jar` in the repository root folder

**Verify Download:**
```bash
ls -lh server.jar          # Linux/macOS
dir server.jar             # Windows
```
Expected size: ~30-40 MB

---

### Step 3: Accept the EULA

**First Run (Required):**

**Linux/macOS:**
```bash
./start.sh
```

**Windows:**
```bash
start.bat
```

The server will create an `eula.txt` file and then shut down.

**Edit the EULA file:**
1. Open `eula.txt` in a text editor
2. Change `eula=false` to `eula=true`
3. Save the file

```txt
#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula).
#Wed May 21 18:00:00 UTC 2026
eula=true
```

---

### Step 4: Configure Server Properties (Optional)

Edit `server.properties` to customize your server:

```properties
# Server name shown in server list
motd=My Minecraft Server

# Game mode: survival, creative, adventure, spectator
gamemode=survival

# Difficulty: 0-3 (peaceful, easy, normal, hard)
difficulty=2

# Max players
max-players=20

# PvP enabled: true/false
pvp=true

# Enable structure generation
generate-structures=true

# World seed (leave blank for random)
seed=

# View distance in chunks
view-distance=10
```

---

## 🎮 Running the Server

### Option 1: Using Start Scripts (Recommended)

**Linux/macOS:**
```bash
chmod +x start.sh   # Make executable (first time only)
./start.sh
```

**Windows:**
```bash
start.bat
```

The server will start and display:
```
[18:00:00] [Server thread/INFO]: Starting minecraft server version 1.17.1
[18:00:02] [Server thread/INFO]: Loading properties
[18:00:03] [Server thread/INFO]: Done (3.245s)! For help, type "help"
```

### Option 2: Manual Command

```bash
java -Xmx1024M -Xms512M -XX:+UseG1GC -jar server.jar nogui
```

---

### Connecting to Your Server

**Local Network:**
1. Open Minecraft Launcher
2. Click **Multiplayer** → **Add Server**
3. Server Address: `localhost` (or your computer's IP)
4. Click **Done** and connect

**From Another Computer:**
1. Find your IP address:
   - Windows: `ipconfig`
   - Linux/macOS: `ifconfig`
2. Share your IP with friends
3. They connect using: `your-ip-address`

---

## ☁️ GitHub Codespaces Setup

Run your server in the cloud without installing Java locally!

### Step 1: Create a Codespace

1. Go to: https://github.com/Amora21118/Minecraft-Server-Java-1
2. Click **Code** → **Codespaces** → **Create codespace on main**
3. Wait 2-5 minutes for setup to complete

### Step 2: Download server.jar in Codespace

Open the terminal and run:
```bash
curl -o server.jar https://launcher.mojang.com/v1/objects/e00c4052dac1d59ffd4cb3442cffafb3b4987b1a/server.jar
```

### Step 3: Start the Server

```bash
./start.sh
```

### Step 4: Access the Server

1. Look for the notification: **"Port 25565 is now available"**
2. Click **Open in Browser** or **Make Public**
3. Share the forwarded URL with players
4. They connect using the public URL as the server address

---

## ⚙️ Server Configuration

### Memory Allocation

Edit `start.sh` or `start.bat` to change RAM:

**start.sh (Linux/macOS):**
```bash
MAX_MEMORY="2048M"    # Maximum RAM (increase if you have it)
MIN_MEMORY="512M"     # Minimum RAM
```

**start.bat (Windows):**
```batch
set MAX_MEMORY=2048M
set MIN_MEMORY=512M
```

**Recommended Settings:**
- Solo/Small server: 512M - 1024M
- 5-10 players: 1024M - 2048M
- 20+ players: 2048M - 4096M

### Important Files

| File | Purpose |
|------|---------|
| `server.jar` | Main server executable |
| `server.properties` | Server configuration |
| `eula.txt` | EULA agreement |
| `world/` | Main world data |
| `logs/` | Server log files |
| `ops.json` | Operator list |
| `banned-players.json` | Banned player list |

---

## 🆘 Troubleshooting

### "server.jar not found"
**Solution:** Download the server jar (Step 2 above)

### "java: command not found"
**Solution:** Install Java 16+
- https://www.oracle.com/java/technologies/downloads/

### Server crashes immediately
**Solution:** 
1. Check `eula.txt` is set to `true`
2. Allocate more RAM: increase `MAX_MEMORY`
3. Check logs in `logs/` folder

### Port 25565 already in use
**Solution:** Change the port in `server.properties`:
```properties
server-port=25566
```

### Players can't connect
**Solution:**
1. Check firewall settings
2. Port forward 25565 in your router
3. Share your public IP address
4. In Codespaces, use the forwarded URL

### Out of memory errors
**Solution:** Increase `MAX_MEMORY` in start script
```bash
MAX_MEMORY="2048M"  # or higher
```

---

## 💬 Server Commands

Use these commands in the server console while it's running:

| Command | Effect |
|---------|--------|
| `help` | Show all commands |
| `stop` | Gracefully shut down server |
| `save-all` | Save all data |
| `say [message]` | Broadcast message to all players |
| `op [player]` | Make player an operator |
| `deop [player]` | Remove operator status |
| `ban [player]` | Ban a player |
| `pardon [player]` | Unban a player |
| `gamemode [mode] [player]` | Change game mode |
| `time set [value]` | Set time of day |
| `weather [clear/rain/thunder]` | Change weather |

---

## 📚 Additional Resources

- **Minecraft Wiki:** https://minecraft.fandom.com/
- **Server Properties Guide:** https://minecraft.fandom.com/en/wiki/Server.properties
- **Minecraft Commands:** https://minecraft.fandom.com/en/wiki/Commands
- **Java Downloads:** https://www.oracle.com/java/technologies/downloads/

---

## 🤝 Support

For issues or questions:
1. Check [Troubleshooting](#troubleshooting) section
2. Review server logs in `logs/latest.log`
3. Open an issue on GitHub: https://github.com/Amora21118/Minecraft-Server-Java-1/issues

---

## 📄 License

This project is for personal use. Minecraft is owned by Mojang Studios.

---

**Happy gaming! 🎮**
