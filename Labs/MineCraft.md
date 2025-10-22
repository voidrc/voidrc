### **1. grab the right server files**

since i am running **CachyOS (Arch-based)** with **XMinecraftLauncher**, here’s what i do:

1. open **CurseForge**, find desired **modpack**.
2. click “...” → “Open Folder” → inside you’ll see `/manifest.json`.
3. go to the pack’s **Files** page on CurseForge — look for a version marked “Server Files” or “Server Pack.”

   * download that ZIP.
4. extract it somewhere safe, like `~/minecraft/modded_server`.

---

### **2. install java & run**

modpacks usually need **Java 17** or newer (check the modpack readme).
install it:
```
sudo pacman -S jdk17-openjdk
```

then from your server folder:
```
java -Xmx6G -Xms4G -jar forge-*.jar nogui
```

(this will generate `eula.txt` — edit to `eula=true`.)

---

### **3. enable cracked clients**

my friends’ “alternative launchers” will need this tweak.
open `server.properties` in the server folder and change:

```
online-mode=false
```

that disables Mojang account verification.
but listen: this also **removes authentication**, so i am opening the door to *anyone* connecting unless i set firewall or whitelist properly.

use a whitelist:
```
white-list=true
```

then add my friends’ usernames manually in `whitelist.json`.

---

### **4. open it to the world**

install ngrok: 
```bash
yay -S ngrok
```

make an ngrok account at [ngrok.com](https://ngrok.com)
link it:
```bash
ngrok config add-authtoken TOKEN_FROM_NGROK
```

start your server normally:
```bash
java -Xmx6G -Xms4G -jar forge-*.jar nogui
```

open another terminal and run:
```bash
ngrok tcp 25565
```

ngrok will print something like:
```bash
Forwarding tcp://0.tcp.ngrok.io:19304 -> localhost:25565
```
that's "public" address — give it to your friends

if you want a hostname (looks cooler), use **DuckDNS** or **No-IP**.

---

### **5. performance & security**

* run server inside a **screen** or **tmux** session:

  ```
  screen -S mcserver
  java -Xmx6G -Xms4G -jar forge-*.jar nogui
  ```
* always keep **online-mode=false** only if you trust the players.
* use `iptables` or `ufw` to restrict access only from your friends’ IPs if you can.
* backup `/world` often. modded worlds corrupt easily.

---
