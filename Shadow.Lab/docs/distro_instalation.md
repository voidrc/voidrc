# Installing a Distro

## VM or bare-metal — what's the difference?

before you install anything, you need to decide _where_ it lives.

**bare-metal** means installing the OS directly onto your machine — replacing or dual-booting alongside your current system. full performance, but risky if something goes wrong.

**VM (Virtual Machine)** means running a fake computer inside your real computer. the OS lives in a window. you can break things, delete it, restore it. nothing touches your real system.

> **recommendation for beginners: start with a VM.** once you're comfortable, move to bare-metal or a dedicated machine.

---

## what you need

### software: VirtualBox

VirtualBox is free software that lets you run VMs on Windows, macOS, or Linux.
1. go to [virtualbox.org](https://www.virtualbox.org/wiki/Downloads)
2. download the version for your current OS
3. install it like any normal program

### the ISO file

an ISO is a disk image — basically a digital version of the installation USB. you download it from the distro's official site.

**not sure which distro to pick?** go back to [distros.md](./distros.md) and use the quick-pick list.

for this guide, we'll use **Kali Linux** as the example.

download the Kali installer ISO from: [kali.org/get-kali](https://www.kali.org/get-kali/)  
choose: **Installer** → **64-bit**

> always download from the official site. never from third-party mirrors you don't trust.

---

## creating the VM in VirtualBox

open VirtualBox and click **New**.

| setting   | recommended value                     |
| --------- | ------------------------------------- |
| Name      | anything (e.g. `kali-lab`)            |
| Type      | Linux                                 |
| Version   | Debian (64-bit)                       |
| RAM       | 2048 MB minimum, 4096 MB better       |
| Hard disk | Create a virtual hard disk → 30–50 GB |

after creating the VM:
1. select it in the list → click **Settings**
2. go to **Storage** → click the empty CD icon → click the disk icon on the right → **Choose a disk file**
3. select the ISO you downloaded
4. go to **System** → **Processor** → give it 2 CPUs if you can spare them
5. click **OK**

---

## running the installer

click **Start** to boot the VM. it'll load from the ISO.

**Kali installer steps (general flow):**
1. select **Graphical Install**
2. choose your language, region, keyboard layout
3. set a hostname (anything, e.g. `kali`)
4. set a username and password — remember these
5. partitioning: choose **Guided — use entire disk** (it's a VM, this is safe)
6. confirm and let it install — takes 10–20 minutes
7. when it asks about GRUB: say yes, install to the primary drive
8. reboot

when it comes back up, log in with the username and password you set.

---

## after install: first things to do

open a terminal inside Kali and run:
```bash
sudo apt update && sudo apt upgrade -y
```

this updates all the preinstalled tools to their latest versions. always do this on a fresh install.

---

## hardware requirements recap

| thing               | minimum              | comfortable                       |
| ------------------- | -------------------- | --------------------------------- |
| RAM (total machine) | 8 GB                 | 16 GB                             |
| disk space for VM   | 20 GB                | 40–50 GB                          |
| CPU                 | any modern dual-core | quad-core with VT-x/AMD-V enabled |

> if your machine is older or low on RAM, **Parrot Security** is lighter than Kali and a solid alternative.

---

## not using VirtualBox?

if you're on Linux already and want to use QEMU/KVM instead, see [QEMU_KVM.md](./QEMU_KVM.md) — more powerful but requires more setup.

---

## next-step

**new to Linux?** don't continue chapter 1 yet — go to chapter 2 (SysAdmin) first. jumping straight into lab setup without knowing basic Linux commands will make everything harder than it needs to be.
→ [Chapter 2: SysAdmin](../../SysAdmin/README.md)

come back here after finishing chapter 2. everything from this point on in chapter 1 is about rebuilding the lab environment — treat it as a practical template once you have the fundamentals.

**already comfortable with Linux basics?** keep going below.
- [Arming up](./need_to_have.md)

optional reference:
- [Shadow.Lab map](../README.md)

global path:
- [Journey](../../JOURNEY.md)
- [Progress Tracker](../../PROGRESS_TRACKER.md)
