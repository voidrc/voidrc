# Lab Setup — What You Need

welcome back. if you're here, you've finished **chapter 2 (SysAdmin)** and know your way around Linux.

this is the practical side of chapter 1. the goal is to reproduce a working lab environment — not just theory. use this as a starting template and adapt it to your own workflow.

> this guide uses **CachyOS Linux**. package names and commands may differ on your distro.  
> if something breaks, check your distro's wiki first.

---

## before you start

assume you have a **freshly installed Linux system** with nothing extra on it yet.

the steps here are not mandatory to follow exactly — they're a reference. pick what's relevant to you and skip what isn't.

---

## step 1: install your tools

install what you need, skip what you don't. packages are grouped by purpose.

### development
```bash
sudo pacman -S git gcc python nodejs go jdk-openjdk docker docker-compose
```

AUR (use your AUR helper, e.g. `yay`):
```bash
yay -S lazygit lazydocker visual-studio-code-bin
```

### programming languages

| language   | package                |
| ---------- | ---------------------- |
| C / C++    | `gcc`                  |
| Python     | `python`               |
| Java       | `jdk-openjdk`          |
| Node.js    | `nodejs`               |
| Go         | `go`                   |
| PowerShell | `powershell-bin` (AUR) |

### communication
```bash
sudo pacman -S telegram-desktop vesktop
```

### gaming (optional)
```bash
sudo pacman -S cachyos-gaming-meta cachyos-gaming-applications
yay -S xmcl-launcher
```

### notes / knowledge base
```bash
sudo pacman -S obsidian
```

---

## step 2: verify docker is running

after installing docker, enable and start the service:
```bash
sudo systemctl enable --now docker
```

add yourself to the docker group so you don't need `sudo` every time:
```bash
sudo usermod -aG docker $USER
```

log out and back in for this to take effect.

---

## next-step

- [QEMU/KVM setup](4_QEMU_KVM.md)

optional reference:
- [Shadow.Lab map](Shadow.Lab/README.md)

global path:
- [Journey](../../JOURNEY.md)
- [Progress Tracker](../../PROGRESS_TRACKER.md)
