## Summary

A **honeypot** is a **deceptive system or service** set up to attract attackers. It mimics real targets but is **isolated and monitored**, allowing defenders to study attacks without risking real assets.

**Purpose**:
- Detect unauthorized or malicious activity    
- Collect malware, attack tools, and TTPs
- Analyze attacker behavior and intent
- Distract attackers from real assets

**Types**:

| Type       | Interaction Level       | Use Case                                         |
| ---------- | ----------------------- | ------------------------------------------------ |
| **Low**    | Simulated responses     | Scanning/bot detection (e.g., Honeyd)            |
| **Medium** | Some real service logic | Basic exploitation (e.g., Cowrie, Dionaea)       |
| **High**   | Full real OS or apps    | Advanced attacker research (custom VM, Honeynet) |

**Core Components**:
- **Fake services** (SSH, FTP, SMB, HTTP)
- **Logging system** (Syslog, ELK, Splunk)
- **Network traffic capture** (tcpdump, Zeek)
- **Out-of-band monitoring** (so attacker can’t detect)

**Monitoring Includes**:
- Login attempts
- Uploaded files/malware
- Commands executed
- Network traffic (internal + external)

**Risks**:
- Attacker may use honeypot to pivot if not isolated
- Legal/ethical implications (especially in high-interaction traps)
- Must not interfere with legitimate infrastructure

---

## SKILLS YOU NEED

- **Basic Linux administration**
- **Python/Bash scripting**
- **Networking (TCP/IP, DNS, HTTP)**
- **Virtualization or cloud platform usage**
- **Log management (ELK, Splunk, etc. optional)**
- **Firewall (iptables/nftables)**
- **T-Pot**

---

## STEPS TO BUILD A FUNCTIONAL HONEYPOT

#### 1. **Choose Honeypot Type**
Decide between:
- **Low-Interaction** – Simulates services (e.g., Cowrie, Honeyd)
- **Medium-Interaction** – More realistic but isolated (e.g., Dionaea)
- **High-Interaction** – Full OS emulation (dangerous but effective, e.g., custom VM)

#### 2. **Setup Environment (VM or Cloud)**
- Use **VirtualBox**, **VMware**, or **cloud instances** (e.g., AWS with security groups locked down).
- Isolate the honeypot network: use **NAT or VLAN** segmentation.
- OS: **Debian minimal install** preferred for simplicity.
#### 3. **Install Honeypot Software**
##### Option A: **Cowrie** (SSH/Telnet honeypot – low/medium interaction)
```bash
sudo apt update
sudo apt install git python3-venv python3-pip -y
git clone https://github.com/cowrie/cowrie.git
cd cowrie
python3 -m venv cowrie-env
source cowrie-env/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
cp etc/cowrie.cfg.dist etc/cowrie.cfg
```

> Edit config to set port, fake credentials, logging output.

Run it:
```bash
bin/cowrie start
```

##### Option B: **Dionaea** (malware collection – SMB, FTP, HTTP emulation)
```bash
sudo apt install dionaea -y
```
Configure `/etc/dionaea/dionaea.conf` for IPs/ports.

##### Option C: **Custom High-Interaction (real OS honeypot)**
- Deploy a **real OS in a VM**, e.g., Debian or Arch Server.
- Expose vulnerable services (RDP, SMB, open shares).
- Use **Sysmon + ELK/Fluentbit** to log everything.
- Monitor via **Velociraptor or OSQuery**.

#### 4. **Logging & Monitoring**
- Forward logs to:
    - **ELK Stack**
    - **Splunk**
    - **Graylog**
    - Or even simple **rsyslog** to a logging server
> Use **Filebeat or Fluentbit** to forward logs.

#### 5. **Network Traffic Capture**
Use **tcpdump**, **Wireshark**, or **Zeek**:
```bash
sudo tcpdump -i any -w /var/log/honeypot/capture.pcap
```

#### 6. **Firewall Rules (to control & log)**
Block all outbound unless needed:
```bash
iptables -A OUTPUT -p tcp --dport 80 -j DROP
iptables -A OUTPUT -p tcp --dport 443 -j DROP
```
Allow honeypot ports only:
```bash
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
```

#### 7. **Deploy to Internet**
Use cloud VPS (DigitalOcean, AWS, etc.) or port forward through home router.

> ⚠️ Ensure **isolated logging and out-of-band access**, so attackers can’t detect or disable your logs.

---

## HOW TO USE EFFECTIVELY

- **Log Everything:** Don't just collect hits. Record sessions, file uploads, commands.
- **Tag IPs:** Correlate IPs with abuse lists (AbuseIPDB, GreyNoise, etc.).
- **Threat Analysis:** Use sandbox (e.g., Cuckoo, Any.run) to analyze dropped binaries.
- **Replay Attacks:** Mimic what the attacker did in a sandbox or honeynet for deeper insight.
- **Automate Reports:** Use Python or ELK dashboards to generate daily summaries.
- **Integrate with SIEM** if used in prod.

---

## EXTRA TIPS

- **Cowrie + Suricata + Zeek** = good stack
- Use **canary tokens** (e.g., Thinkst) for early detection
- Deploy in **multiple regions/IPs** to attract diverse attacks
- Rotate or **rebuild weekly** to stay fresh
