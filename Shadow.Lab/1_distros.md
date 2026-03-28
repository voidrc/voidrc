# Operating Systems & Distros

## wait — what even is a distro?

you've probably heard the word "Linux" thrown around. but unlike Windows or macOS, Linux isn't one product made by one company. it's a **free, open-source core** (called a kernel) that anyone can build an operating system around.

those builds are called **distributions** — or just **distros**.

think of it like this:

- the Linux kernel = an engine
- a distro = a full car built around that engine — different shape, color, features, purpose

that's why there are hundreds of them. they all run Linux underneath, but they look and feel completely different.

---

## so which one do i use?

**rule #1:** there's no "one distro to rule them all."

every distro has a purpose. some are built for everyday use, some for security research, some for privacy. the right one depends on what you're doing.

> for now: don't overthink it. you're here to learn. pick something from the list below and get going.

---

## the quick-pick list

### security / hacking-focused

these come preloaded with tools used in penetration testing and security research. good for learning, not meant for daily use.

| distro                   | based on | good for                                                      |
| ------------------------ | -------- | ------------------------------------------------------------- |
| **Kali Linux**           | Debian   | the industry standard. packed with tools. can feel heavy.     |
| **Parrot Security**      | Debian   | lighter than Kali, easier on older hardware.                  |
| **BlackArch**            | Arch     | massive tool library. steep learning curve — not for day one. |
| **Fedora Security Spin** | Fedora   | solid for learning pentest workflows, clean interface.        |

> **Kali** and **Parrot** are the most beginner-accessible of this group. Kali has the most tutorials and community support online.

### privacy / anonymity-focused

these are built to leave as few traces as possible.

| distro       | what makes it special                                                           |
| ------------ | ------------------------------------------------------------------------------- |
| **Tails**    | runs from a USB stick, leaves nothing on the machine after shutdown.            |
| **Whonix**   | routes all traffic through Tor. designed to run inside a VM.                    |
| **Qubes OS** | every app runs in its own isolated VM. the most secure — also the most complex. |

> **Tails** is the easiest entry point here. you can run it without installing anything.

---

## a note on "base systems"

you'll often see terms like "Debian-based" or "Arch-based." this just means the distro was built on top of another distro's foundation. it affects things like how you install software.

the two most common bases you'll encounter:
- **Debian / Ubuntu** → uses `apt` to install packages
- **Arch** → uses `pacman` to install packages

you don't need to memorize this now. just know it's why some commands look slightly different between guides.

---

## my build (proof of concept)

i don't use a premade security distro. i run **CachyOS Linux** with:
- **Hyprland** — a tiling window manager. fast, clean, fully customizable.
- **BlackArch repo** — plugs the entire BlackArch tool library into my Arch install.

result: a high-performance machine built exactly to my workflow — not someone else's defaults.

this is the endgame approach. not where you start.

---

## next-step

if you're still unsure, pick **Kali** or **Parrot** and continue. both are beginner-friendly and have lots of tutorials.

then continue here:
- [Installing a Distro](2_distro_instalation.md)

optional reference:
- [Shadow.Lab map](Shadow.Lab/README.md)

global path:
- [Journey](../../JOURNEY.md)
- [Progress Tracker](../../PROGRESS_TRACKER.md)
