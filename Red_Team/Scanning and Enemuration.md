## 🎯 Goal:

Identify and enumerate services, configurations, and vulnerabilities across systems and applications for penetration testing, red teaming, or vulnerability assessments.

---

## 🧭 Module 1: Foundations of Enumeration

### 📘 Topics:

* What is enumeration vs scanning
* Port states (open/closed/filtered)
* TCP/IP protocols, banners, and service identification

### 🛠️ Tools:

* **Nmap**

  * `-sV`, `-A`, `--script`, `-p-`, `-Pn` flags
* **Netcat**, **Telnet**, **Banners with Curl/Wget**

### 🧪 Labs:

* Use VulnHub or TryHackMe's "Nmap" and "Basic Pentesting"
* Enumerate ports and services manually and with Nmap NSE scripts

---

## 🔍 Module 2: Service Enumeration

### 📘 Topics:

* Protocol-specific enumeration (FTP, SMB, SNMP, HTTP, etc.)
* Banner grabbing techniques
* Common misconfigurations

### 🛠️ Tools:

* **Enum4linux-ng**, **smbclient**, **rpcclient**
* **SNMPwalk**, **onesixtyone**
* **Telnet**, **Netcat**, **nmap -sC**, **Nmap NSE scripts**

### 🧪 Labs:

* Practice on machines with open SMB, FTP, and SNMP
* Identify shared folders, user accounts, and vulnerable services

---

## 🕸️ Module 3: Web Application Enumeration

### 📘 Topics:

* Virtual host discovery
* Directory and file enumeration
* Web tech fingerprinting

### 🛠️ Tools:

* **Gobuster**, **Dirb**, **FFUF**
* **WhatWeb**, **Wappalyzer**
* **Nikto**, **Nmap http-enum**, **httprobe**

### 🧪 Labs:

* DVWA, Mutillidae, and Juice Shop on localhost
* Enumerate paths, admin panels, backup files

---

## 🧰 Module 4: Vulnerability Scanning Tools

### 📘 Topics:

* Authenticated vs unauthenticated scanning
* False positives/negatives
* CVSS scoring, basic risk assessment

### 🛠️ Tools:

* **OpenVAS** / **Greenbone**
* **Nessus Essentials**
* **Nuclei** (template-based scanning)
* **LinEnum**, **Linux Exploit Suggester**, **WinPEAS**

### 🧪 Labs:

* Scan Metasploitable 2 & 3
* Validate findings manually from vulnerability scanners

---

## 📦 Module 5: Advanced Enumeration & Automation

### 📘 Topics:

* Chaining enumeration tools
* Python automation of scanning workflows
* Enumeration in Active Directory

### 🛠️ Tools:

* **CrackMapExec**, **BloodHound**, **LDAP queries**
* **Recon-ng**, **SpiderFoot** (automated recon)
* Python scripting with `nmap`, `socket`, `requests`, and `paramiko`

### 🧪 Labs:

* Use `CrackMapExec` in an AD lab
* Write a Python script that finds open ports and performs banner grabbing

---

## 📚 Resources & Practice Platforms

* **Books**:

  * *The Hacker Playbook 3*
  * *Penetration Testing* by Georgia Weidman
  * *Nmap Network Scanning* by Fyodor

* **Platforms**:

  * TryHackMe: “Network Services”, “Vulnversity”, “Enumeration”
  * HackTheBox: Easy boxes for practical enumeration
  * VulnHub: Metasploitable, Kioptrix, Stapler

---

## ✅ Final Project:

Choose a vulnerable machine and write a **full enumeration report**, including:

1. Network map
2. Service enumeration
3. Vulnerability findings
4. Manual validation steps
5. Suggested exploits or mitigations