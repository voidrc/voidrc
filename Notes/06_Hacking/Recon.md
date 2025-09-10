Here's a **detailed reconnaissance (recon) guide** for web application security testing. This guide is tailored for **ethical hacking**, **bug bounties**, or **penetration testing**—*make sure you have proper authorization before proceeding*.

---

## 🧠 Phase 1: Passive Reconnaissance

Goal: Gather as much information as possible **without directly interacting** with the target application.

### 🔍 1.1 Collect Target Info

* Target URL or domain
* Company profile (employees, tech stack, subdomains)

### Tools:

* `whois domain.com`
* `nslookup domain.com`
* [crt.sh](https://crt.sh) (search SSL certs for subdomains)
* [SecurityTrails](https://securitytrails.com)
* [Shodan](https://shodan.io)
* [Censys](https://search.censys.io/)
* `curl -I https://target.com` (check headers)

---

## 🛰️ Phase 2: Subdomain Enumeration

Find hidden or forgotten subdomains.

### Automated Tools:

* `subfinder -d target.com`
* `amass enum -passive -d target.com`
* `assetfinder --subs-only target.com`
* [Findomain](https://github.com/Edu4rdSHL/findomain)

### Bonus:

* Use [waybackurls](https://github.com/tomnomnom/waybackurls) to find historical endpoints:

  ```bash
  echo "target.com" | waybackurls > urls.txt
  ```

---

## 🌐 Phase 3: Web Technology Fingerprinting

Understand what tech stack the app uses.

### Tools:

* `whatweb https://target.com`
* `builtwith.com`
* [Wappalyzer browser extension](https://www.wappalyzer.com/)
* `nmap -sV -p- target.com` (service detection)
* `httprobe`, `httpx` for probing multiple subdomains

---

## 🧪 Phase 4: Active Recon (Authorized Only)

Interact with the app to uncover endpoints, input fields, cookies, etc.

### 4.1 Crawl and Directory Bruteforce

* `ffuf -u https://target.com/FUZZ -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt`
* `gobuster dir -u https://target.com -w common.txt`
* `feroxbuster -u https://target.com`

### 4.2 JS File Analysis

* Download JavaScript files:

  ```bash
  curl https://target.com/main.js
  ```
* Look for:

  * Hidden endpoints
  * API keys or tokens
  * Commented-out code
  * Hardcoded credentials

Use:

* [LinkFinder](https://github.com/GerbenJavado/LinkFinder)
* `gf` patterns (`gf sqli`, `gf xss`, `gf lfi`, etc.)

---

## 🔑 Phase 5: Authentication and Session Analysis

### Checklist:

* Login, signup, forgot password
* Session management:

  * Is the cookie `HttpOnly`, `Secure`, `SameSite=Strict`?
  * Is JWT predictable?
* Brute-force protection?
* Rate limiting?

Tools:

* `Burp Suite` → Repeater/Intruder
* `ffuf`, `hydra` (for brute-force simulation—ethically!)

---

## 🧱 Phase 6: Analyze APIs (if present)

### Find API endpoints:

* Check network tab (DevTools → XHR/Fetch)
* Mobile apps often use same API endpoints
* Swagger docs (`/swagger`, `/api/docs`)

### Tools:

* `Postman`
* `Burp Suite` (proxy all requests)
* `nuclei -t cves/ -u https://api.target.com`

Look for:

* Rate limits
* Verb tampering (e.g., GET vs POST)
* Insecure direct object references (IDOR)
* Missing auth on admin endpoints

---

## 📜 Phase 7: Historical Data and Archives

### Tools:

* `waybackurls`, `gau`, `urlhunter`
* `web.archive.org`

Search:

* Deleted endpoints
* Old APIs
* Admin panels

---

## ⚙️ Phase 8: Vulnerability Pattern Hunting

Use tools or grep patterns to search for specific types of flaws:

### Tools:

* [gf patterns](https://github.com/tomnomnom/gf)
* [nuclei](https://github.com/projectdiscovery/nuclei)
* [dalfox](https://github.com/hahwul/dalfox) – XSS
* [SQLMap](https://github.com/sqlmapproject/sqlmap)
* [XSStrike](https://github.com/s0md3v/XSStrike)

---

## 📌 Final Recon Tips

* Always **automate what you can** and **manually verify**.
* Chain tools: output of `amass` → `httpx` → `nuclei` → `ffuf`
* Use `Burp Suite Pro` if available – for scanning, repeater, intruder, and extender modules.
* Keep notes of every endpoint, parameter, and test.

---

If you want, I can provide a **bash script to automate the passive + subdomain + tech stack part**, or tailor this guide to **bug bounty targets** (e.g., HackerOne or Bugcrowd).

Want that?
