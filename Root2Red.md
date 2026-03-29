# Root2Red Roadmap

Move from systems operations to offensive security in clear, testable stages.

---

## Operating Rule

1. Build fundamentals first.
2. Keep everything legal and lab-contained.
3. Track progress weekly with practical evidence.
4. Do not jump stages.

Primary tracker:

- [Ultimate Journey Protocol](./JOURNEY.md)
- [Progress Tracker](./PROGRESS_TRACKER.md)

---

## Stage 1: Become Employable in Ops (SysAdmin/Support)

Goal: get paid, production-grade exposure to systems and networks.

### Skill Tracks

#### Linux Administration

- References:
  - [Linux Administration overview](https://www.geeksforgeeks.org/linux-unix/what-is-linux-system-administration/)
  - [Linux Journey](https://linuxjourney.com)
  - [OverTheWire Bandit](https://overthewire.org/wargames/bandit)
- Books:
  - The Linux Command Line - William Shotts
  - How Linux Works - Brian Ward
- Internal notes:
  - [SysAdmin](./SysAdmin/README.md)

#### Windows Administration

- References:
  - [Microsoft Learn](https://learn.microsoft.com/)
  - [Windows Administration overview](https://resumecat.com/blog/what-does-a-windows-administrator-do)
- Book:
  - Windows Server 2025 Administration Fundamentals - Bekim Dauti

#### Network Administration

- References:
  - [Network Administration overview](https://www.geeksforgeeks.org/computer-networks/what-does-a-network-administrator-do/)
  - [Practical Networking](https://www.practicalnetworking.net/)
  - [Professor Messer Network+](https://www.professormesser.com/network-plus/)
  - [Packet Tracer intro](https://www.netacad.com/courses/networking-basics?courseLang=en-US)
- Books:
  - Computer Networking: A Top-Down Approach - Kurose and Ross
  - Network Warrior - Gary Donahue
  - The TCP/IP Guide - Charles Kozierok

### Suggested Certifications

- [CompTIA Linux+](https://www.comptia.org/en-us/certifications/linux/)
- [CompTIA Server+](https://www.comptia.org/en-us/certifications/server/)
- [CompTIA Network+](https://www.comptia.org/en-us/certifications/network/)

### Lab and Portfolio Deliverables

- Build one Linux server baseline image.
- Build one Windows AD lab environment.
- Build one small segmented network simulation.
- Publish scripts and setup docs in GitHub.

### Job Application Plan

- Target roles:
  - Junior System Administrator
  - IT Support Specialist
  - NOC / Infrastructure Technician
  - Cloud Support Associate
- Target channels:
  - LinkedIn Jobs
  - Indeed
  - Dice
  - Wellfound
  - Company career pages

Exit criteria:

- You can show practical lab evidence.
- You can explain incidents and fixes clearly.
- You get production or production-like systems exposure.

---

## Stage 2: Transition to Security Testing

Goal: shift from operations to offensive assessment basics.

### Core Topics

- Web and API testing fundamentals
- Vulnerability validation and reporting
- Methodology-driven testing

### Learning Resources

- Books:
  - The Web Application Hacker's Handbook - Dafydd Stuttard and Marcus Pinto
  - Penetration Testing: A Hands-On Introduction to Hacking - Georgia Weidman
- Platforms:
  - [TryHackMe](https://tryhackme.com/)
  - [Hack The Box](https://www.hackthebox.com/)
  - [PortSwigger Web Security Academy](https://portswigger.net/web-security)
- Frameworks:
  - [OSSTMM](https://www.pentesting.org/methodology-understanding-guide/)
  - [PTES](https://www.pentesting.org/technical-testing-guide/)
  - [MITRE ATT&CK](https://attack.mitre.org/resources/)

### Suggested Certifications

- CompTIA Security+
- eJPT

### Coding Focus

- [Python](./Languages.md#python)
- [JavaScript](./Languages.md#javascript)
- [SQL](./Languages.md#sql)

Exit criteria:

- You can complete and document full lab assessments.
- You can write high-quality vulnerability reports.
- You can automate repeatable testing tasks safely.

---

## Stage 3: Red Team Specialization (Long-Term)

Goal: develop advanced offensive depth while maintaining strong defensive understanding.

### Advanced Domains

#### Exploit Development and Low-Level

- Languages:
  - [C/C++](./Languages.md#cc)
  - [Assembly](./Languages.md#assembly)
  - [Ruby](./Languages.md#ruby)
- Books:
  - The Shellcoder's Handbook - Koziol et al.
  - Hacking: The Art of Exploitation - Jon Erickson
- Practice:
  - [Exploit Education](https://exploit.education/)

#### Reverse Engineering and Malware Analysis

- Books:
  - Practical Reverse Engineering - Dang et al.
- References:
  - [Malware Unicorn](https://malwareunicorn.org/)
  - [Ghidra](https://ghidra-sre.org/)
- Tooling focus:
  - Ghidra, GDB, IDA, x64dbg/OllyDbg, sandboxing workflows

#### Red Team Operations

- Privilege escalation on Linux and Windows
- Lateral movement in controlled labs
- Detection-aware tradecraft and reporting

### Suggested Certifications

- eCPPT
- OSCP
- CRTP
- OSCE (advanced)

Exit criteria:

- You can run complete red-team-style lab exercises end-to-end.
- You can explain tactics, detections, and mitigations.
- You can produce operator-grade documentation and debriefs.

---

## Practice Playground Bank

Use these as repeatable practice lanes by type.

### Labs and CTF

- Root Me
- Hack The Box
- TryHackMe
- OverTheWire
- CyberSecLabs
- VulnHub

### Bug Bounty and AppSec

- PortSwigger Web Security Academy
- Hacker101
- PentesterLand
- Checkmarx training content
- Kontra Application Security Training

### Community and Learning Channels

- Stok YouTube
- InsiderPhD YouTube
- TCM Security
- NahamSec resources
- Jhaddix bug bounty resources
- Zseano methodology notes
