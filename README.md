# Minecraft Java Edition 1.13.2 Server in GitHub Codespaces

This guide will help you run an official Minecraft Java Edition vanilla 1.13.2 server in GitHub Codespaces on Android or any browser.

## Prerequisites

- A GitHub account
- GitHub Codespaces access (included with GitHub Pro or personal repositories)
- A web browser on Android or any device
- A Minecraft Java Edition client (version 1.13.2)

## Step-by-Step Setup

### Step 1: Open GitHub Codespaces

1. Go to your repository: `https://github.com/Amora21118/Minecraft-Server-Java-1`
2. Click the green **Code** button
3. Click the **Codespaces** tab
4. Click **Create codespace on main**
5. Wait for the environment to load (this may take 1-2 minutes)

### Step 2: Update the System Package Manager

Once Codespaces has loaded and you see the terminal, run:

```bash
sudo apt update
```

### Step 3: Install Java 8 (Eclipse Adoptium Temurin)

Run the following commands in order:

```bash
sudo apt install -y wget
```

```bash
wget -qO - https://packages.adoptium.net/adoptium/KEY.asc | sudo apt-key add -
```

```bash
sudo sh -c 'echo "deb https://packages.adoptium.net/adoptium/deb/ jammy main" > /etc/apt/sources.list.d/adoptium.list'
```

```bash
sudo apt update
```

```bash
sudo apt install -y temurin-8-jdk
```

### Step 4: Verify Java Installation

Confirm Java is installed correctly:

```bash
java -version
```

You should see output showing Java version 8.x.x from Eclipse Adoptium.

### Step 5: Create a Directory for the Server

Create a dedicated folder for your Minecraft server:

```bash
mkdir -p ~/minecraft-server && cd ~/minecraft-server
```

### Step 6: Download the Minecraft 1.13.2 Server JAR

Download the official Minecraft server jar file:

```bash
wget https://launcher.mojang.com/v1/objects/3737db93722343ba611027c635cbe434b3544f46/server.jar
```

### Step 7: Accept the EULA

The server requires you to accept the End User License Agreement. First, run the server to generate the `eula.txt` file:

```bash
java -Xmx1024M -Xms1024M -jar server.jar nogui
```

Wait about 10 seconds. You will see messages in the terminal, and a file called `eula.txt` will be created. Then press `Ctrl+C` to stop the server.

### Step 8: Edit the EULA File

Open the `eula.txt` file to accept the agreement:

```bash
nano eula.txt
```

You will see a line that says:

```
eula=false
```

Change `false` to `true` so it reads:

```
eula=true
```

To save and exit:
- Press `Ctrl+O` (press Enter to confirm)
- Press `Ctrl+X`

### Step 9: Start the Minecraft Server

Now that the EULA is accepted, start your server:

```bash
java -Xmx1024M -Xms1024M -jar server.jar nogui
```

Wait for the message that says `Done! For help, type "help"`. The server is now running!

### Step 10: Forward the Minecraft Server Port

To connect to your server from Minecraft, you need to forward the server port. In Codespaces:

1. Look at the terminal window for a **Ports** tab or panel
2. If you don't see it, press `Ctrl+Shift+` (backtick) to open the Command Palette
3. Type "Ports: Focus on Ports View" and press Enter
4. The server runs on port **25565** (the default Minecraft port)
5. If the port isn't visible, click the **Forward a Port** button
6. Enter `25565` and press Enter
7. Right-click port 25565 and set visibility to **Public**

### Step 11: Connect to Your Server from Minecraft

1. Open Minecraft Java Edition
2. Click **Multiplayer**
3. Click **Add Server**
4. Enter a name (e.g., "My Codespaces Server")
5. For the server address, go back to Codespaces and copy the public URL from the Ports panel
   - It will look like: `{some-name}-{number}.{region}.codespaces.github.dev`
   - Enter this address in Minecraft
6. Click **Done** and then double-click your server to join

### Step 12: Restarting the Server After Closing

If you close the terminal or restart Codespaces, here's how to start the server again:

```bash
cd ~/minecraft-server && java -Xmx1024M -Xms1024M -jar server.jar nogui
```

## Stopping the Server

To stop the server safely while it's running, type in the terminal:

```
stop
```

Wait for the message `Saved the game` and the server will shut down gracefully.

## Troubleshooting

**Problem: Port not showing up in Codespaces**
- Make sure the server is running before checking ports
- Restart Codespaces if needed

**Problem: Can't connect to the server from Minecraft**
- Verify the port 25565 is set to **Public** in the Ports panel
- Check that your Minecraft client version is 1.13.2
- Make sure the server shows "Done! For help, type 'help'" in the terminal

**Problem: Server runs out of memory**
- The default 1024MB is usually fine, but if you need more, modify the command:
  ```bash
  java -Xmx1536M -Xms1536M -jar server.jar nogui
  ```
  (Replace 1536 with your desired amount in MB)

## Server Properties

Once the server runs, a `server.properties` file is created. You can edit it to change:
- Server name: `motd=`
- Max players: `max-players=`
- Game mode: `gamemode=survival` (or `creative`, `adventure`, `spectator`)
- Difficulty: `difficulty=`

Edit it with:

```bash
nano server.properties
```

Then restart the server for changes to take effect.

## Additional Notes

- Your Codespaces environment is free for up to 60 hours per month
- Server data persists between Codespaces sessions if you keep the environment
- For permanent server hosting, consider services like AWS, Azure, or traditional Minecraft hosting providers
- Java 8 is optimized for Minecraft 1.13.2

## Support

For issues with Minecraft itself, visit: https://www.minecraft.net/en-us/support
For Codespaces help, visit: https://docs.github.com/en/codespaces

Enjoy your Minecraft server! 🎮
