# Ultimate Journey Protocol

This vault is strongest when followed in order.
Use this file as your navigation spine for the active phase.

execution tracker:
- [Progress Tracker](./PROGRESS_TRACKER.md)

---

## Rules Of Progression

1. Do not skip stages.
2. Finish the listed notes in sequence.
3. Build while reading (commands, labs, scripts, notes).
4. Keep a weekly log of what you tested and broke.
5. Move to the next chapter only after completing the checkpoint.


---

## Phase 1

Phase 1 is about Operating System.
It is split into 3 chapters:
1. Shadow.Lab
2. SysAdmin
3. Bash (basic automation)

---

## Chapter 1: Shadow.Lab

Goal: build the lab, wire access, and work inside a controlled environment.

1. [Shadow.Lab/README.md](./Shadow.Lab/README.md)
2. [Shadow.Lab/docs/static-IP.md](./Shadow.Lab/docs/static-IP.md)
3. [Shadow.Lab/docs/SSH-setup.md](./Shadow.Lab/docs/SSH-setup.md)
4. [Shadow.Lab/docs/QEMU_KVM.md](./Shadow.Lab/docs/QEMU_KVM.md)
5. [Shadow.Lab/docs/basic-vm.md](./Shadow.Lab/docs/basic-vm.md)
6. [Shadow.Lab/docs/Recon.md](./Shadow.Lab/docs/Recon.md)
7. [Shadow.Lab/docs/NMAP.md](./Shadow.Lab/docs/NMAP.md)
8. [Shadow.Lab/docs/Scanning and Enemuration.md](./Shadow.Lab/docs/Scanning%20and%20Enemuration.md)
9. [Shadow.Lab/docs/Upgrading Shell.md](./Shadow.Lab/docs/Upgrading%20Shell.md)
10. [Shadow.Lab/docs/HoneyPot.md](./Shadow.Lab/docs/HoneyPot.md)

Checkpoint:

- The lab network is up.
- SSH works the way you want it to.
- You can create and maintain at least one reproducible VM.

---

## Chapter 2: SysAdmin

Goal: become dangerous in Linux administration, not just comfortable in Linux.

1. [SysAdmin/README.md](./SysAdmin/README.md)
2. [Linux/04. Root.md](./Linux/04.%20Root.md)
3. [Linux/05. File System.md](./Linux/05.%20File%20System.md)
4. [Linux/06. File Manipulation I.md](./Linux/06.%20File%20Manipulation%20I.md)
5. [Linux/07. File Manipulation II.md](./Linux/07.%20File%20Manipulation%20II.md)
6. [Linux/partitioning.md](./Linux/partitioning.md)
7. [Linux/BackUp_Options.md](./Linux/BackUp_Options.md)

Checkpoint:

- You understand users, root, filesystem layout, and storage basics.
- You can recover from your own mistakes with backups or snapshots.
- You can explain your host layout without guessing.

---

## Chapter 3: Bash (Basic Automation)

Goal: automate operator work instead of repeating it by hand.

1. [Scripting/Bash/README.md](./Scripting/Bash/README.md)
2. [Resources/Scripting.md](./Resources/Scripting.md)

Checkpoint:

- You can read and write basic shell scripts.
- You can automate at least one backup, log, or setup task.
- You understand when Bash is enough and when it is time to move on.

---

## Deferred Material

Not everything belongs in active phase 1.

Future topics and deferred notes live here:

- [Yeet/README.md](./Yeet/README.md)

When phase 1 is stable, that folder becomes the queue for phase 2 and beyond.

---

## Side Track: Nihongo (Optional Discipline)

Use this track for consistency and memory training.

1. [Nihongo/1. Intro.md](./Nihongo/1.%20Intro.md)
2. [Nihongo/hiragana-chart-by-tofugu.jpg](./Nihongo/hiragana-chart-by-tofugu.jpg)

Checkpoint:

- You can read basic hiragana rows aloud.
- You can write all vowels and K/S/T/N/H/M/Y/R/W lines from memory.

---

## Weekly Cadence

1. 5 study sessions per week (60-90 min each).
2. 1 lab day per week (hands-on only).
3. 1 review day per week (summarize and fill gaps).

Use this pattern:

- Mon-Fri: progress through current chapter notes.
- Sat: practical lab and writeup.
- Sun: revision and plan next week.

---

## Completion Standard

A chapter is complete only when:

1. Notes are read and summarized.
2. Commands or tooling were tested in practice.
3. You can explain the chapter to someone else without reading.

If one of these is missing, repeat the chapter.
