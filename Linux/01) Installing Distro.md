> if you’ve never touched linux and still rely on windows or mac, start safe. using **VirtualBox** is recommended. check tutorials for installing VirtualBox on your system first. [here](../VirtualBox/Installation.md) you can find guide on how to install _Oracle VirtualBox_ on Arch-based  distros

so there are plenty of linux distros to choose from, and they all work almost the same — with a few key differences. in this folder i’ll guide using **Parrot Home**, and **Arch**, but you can choose any distro according to your liking. if you haven’t chosen one yet, check the decision tree below.

- **you want convenience & preloaded pentest tools** → Kali Linux, Parrot Security
- **you want a clean, stable, rpm/fedora-based option with security tools** → Fedora Security Spin
- **you want a modular, minimal, user-built system** → Arch (with an optional BlackArch repo for pentest tools)
- **you want a huge toolset and are comfortable with pacman/arch** → BlackArch
- **you want a lightweight, ubuntu-based entry** → BackBox
- **you want to learn compiling and fine-grained control** → Pentoo (Gentoo derived)
- **you need strong anonymity & amnesia** → Tails (live), Whonix (VM gateway), Qubes (isolation-first)
- **you’re focused on forensics** → CAINE, DEFT

> installation of distros may differ too, so check tutorials for that — i’ll try to cover installs for Arch and Parrot

environment checklist (before you install):
- **decide: VM or bare-metal?**
    - vm (virtualbox / qemu+virt-manager): safer for testing, easy snapshots.
    - bare-metal: better hardware performance, riskier if you’re still learning.
- **hardware basics**
    - CPU: virtualization support (VT-x / AMD-V) enabled in BIOS/UEFI.
    - ram: 8GB min for comfortable VMs; 16GB+ for heavy multitasking or Qubes.

---
# Installation (ParrotOS Home)

for any distro in the debian/ubuntu family (like kali, ubuntu, mint, zorin, etc), i’ll use **parrot home** as the example flow since it’s lightweight + user-friendly.  
the install process is 90% the same across all these distros — only branding/themes differ. so follow this guide for parrot, and you can apply the same steps to any of its cousins.

1. **Download ISO**  
   grab the ISO from the [official site](https://www.parrotsec.org/download/)  
   → pick **Live → Home → AMD64**

2. **Prepare battleground**  
   - **USB stick** → burn ISO with tools like *balenaEtcher* or *Rufus*  
   - **VirtualBox** → create a new VM (Linux → Debian 64-bit) and mount the ISO  

3. **Boot into installer**  
   start from your USB/VM and pick **Try/Install** from the menu.  

4. **Start installer**  
   once the live session loads, double-click the **Install Debian (Parrot logo)** icon.  

5. **Language, region, keyboard**  
   follow the prompts → pick what matches your setup.  

6. **Partitioning**  
   - on VirtualBox → safe to use **Erase disk**  
   - on real hardware → follow tutorials/youtube for manual partitioning  

7. **User & password**  
   create your **user account** (don’t daily-drive `root`) and set a strong password.  

8. **Install system**  
   let the installer copy files and finish setup (~10–20 mins).  

9. **Reboot**  
   remove the USB or unmount ISO → log in with your new user account.  

## BlackArch (on top of Arch)

the reason i chose this distro for demonstration is simple: **DIY or die**.  
unlike kali, parrot, or other preloaded hacker distros, **arch starts barebones** — you build *everything* yourself.

that’s why it’s labeled “advanced users only.” but honestly? it’s one of the most rewarding ways to learn linux: every screw-up is a lesson, every reboot a checkpoint.

> forget the mistake, remember the lesson.

### Quick install notes (overview)
1. **Download ISO**  
   grab the ISO from an official mirror (search for *archlinux-x86_64.iso*). pick the latest release.

2. **Prepare battleground**  
    - **USB stick** → burn the ISO with balenaEtcher, Rufus, or dd.  
    - **VirtualBox** → create a new VM (Linux → Arch 64-bit) and attach the ISO.

3. **Boot into installer**  
   boot your USB/VM and wait for the live prompt:  
   `root@archiso ~ #` (this is where the real fun starts)

4. **Begin installation**  
    - if you’re curious but not masochistic, run `archinstall` (guided installer).  
    - if you want full control and the true Arch experience, follow the Arch Wiki installation guide.

5. **BlackArch on top of Arch**  
   after a working Arch base, add the BlackArch repo (official instructions on the BlackArch site) to get the full pentest toolset.

### Resources
- Arch Wiki — Installation guide (canonical reference).  
- BlackArch — official site for repo/installation instructions.

> i’m not here to baby-sit you with videos. if you want to be the best, accept the pain and learn from it