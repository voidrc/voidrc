Nmap(Network Mapper) is an open-source and versatile network scanning tool widely used in cybersecurity and IT fields. It helps security professionals, network administrators, and penetration testers to map out networks, discover active hosts, and identify open ports and services.

## Key Features of NMAP
Nmap is a powerful tool with a variety of features designed for network discovery, analysis, and security assessment. Here are its key features:
1) Network Discovery
	- Identifies active hosts within a network
	- Supports scanning individual ports
2) Port Scanning
	- Scans for open, closed, or filtered ports on target systems
	- Supports scanning individual ports, specific port ranges, or all 65535 ports
3) Service Version Detection
	- Determines the  type and version of services running on open ports
	- Helps identify vulnerabilities associated with outdated services
4) Operating System Detection
	- Detects the operating system of target devices, including version details and hardware information
	- Useful for profiling target systems during penetration testing
5) Scripting Engine(NSA)
	- Executes Custom or built-in scripts to perform advanced tasks such as:
		- Vulnerability Detection
		- Malware Identification
		- Service Enumeration
		- Network Policy Compliance Checks
	- Includes pre-built scripts for specific use cases, such as identifying CVEs or SQL injection
6) Aggressive Scanning
	- Combines service version detection, OS detection, and traceroute in a single scan to gather comprehensive data about target
7) Output Customization
	- Generates reports in multiple formats:
		- Normal (-oN), XML (-oX), and grepable (-oG) formats
		- Supports saving outputs for later analysis or integration with other tools
8) Flexible Scanning Techniques
	- Offers a variety of scan modes to suit different needs:
		- SYN Scan (-sS): Stealthy and Efficient
		- TCP Connect Scan (-sT): Establishes a full TCP connection
		- UDP Scan (-sU): Explores open UDP Ports
		- Ping Scan (-sP): Detects live hosts without performing port scans
9) IPv6 Support
	- Fully supports IPv6 scanning to accommodate modern network configurations
10) Speed and Timing Control
	- Adjustable scanning speed to balance efficiency and stealth
		- -T4 for fast scans
		- -T0 for highly stealthy scans
11) Traceroute
	- Maps the path packets take to reach the target
	- Identifies intermediate devices and  networks in the route
12) Vulnerability Assessment
	- Leverage NSE scriptts to detect sppecific vulnerablities and misconfigurations, such as:
		- SQL injection
		- Weak SSL/TLS
		- Open SMB shares
13) Advanced Packet Manipulation
	- Customizes packet data, length, and checksum to evade detection or tailor scans for specific targets
14) Security and Privacy Testing
	- Detect web application vulnerabilities, HTTP headers, and SSL certificate issues
	- Performs brute-forcing and checks for anonymous login possibilities in FTP or SMB protocols

## Command Categories
- **Basic Scans**: Commands for scanning single targets, multiple targets, ranges or subnets.
- **Port Scans**: Includes specific port scans, all-port scans, and common-port scans
- **Service and OS Detection**: Commands for identifying services versions and operationg systems
- **Advanced Scans**: Techniques like TCP connect, SYN, and UDP scans, as  well as aggressive scanning
- **Output Options**: Saving results in various formats (normal, XML, grepable, all formats)
- **Script Usage**: Leveraging Nmap scripts for vulnerability detection,  HTTP enumeration, and more
- **Vulnerability Scanning**: Scripts targeting specific CVEs and weaknesses like SQL injection, XSS, and SSL/TLS issues
- **Miscellaneous Options**: Includes traceroute, adjusting scan speeds, and customized packet settings

## NMAP Commands

| Command                               | Description                                                  |
| ------------------------------------- | ------------------------------------------------------------ |
| nmap {target}                         | Basic Scan                                                   |
| nmap {target1} {target2}              | Multi Target Scan                                            |
| nmap 192.168.1.1-50                   | Scan a Range of IPs                                          |
| nmap 192.168.1.0/24                   | Scan Entire Subnet                                           |
| nmap -p 22,80,443 {target}            | Scan Specific Ports                                          |
| nmap -p- {target}                     | Scan Entire Ports                                            |
| nmap -sV {target}                     | Detects Service Version                                      |
| nmap -O {target}                      | Detect Operating System                                      |
| nmap -sT {target}                     | Performs TCP connect scan                                    |
| nmap -sS {target}                     | Performs SYN scan                                            |
| nmap -sU {target}                     | Performs UDP scan                                            |
| nmap -A {target}                      | Aggressive Scan                                              |
| nmap -Pn {target}                     | Treat all hosts as online -- skip host discovery             |
| nmap -sL {target}                     | List targets without scanning                                |
| nmap -sn {target}                     | Perform ping scan if hosts are alive                         |
| nmap -sN {target}                     | Perform a Null scan                                          |
| nmap -sF {target}                     | Perform FIN scan                                             |
| nmap -sX {target}                     | Perform an Xmas scan                                         |
| nmap -PE {target}                     | Use ICMP echo requests for host discovery                    |
| nmap -PR {target}                     | Use ARP requests for host discovery on local networks        |
| nmap -sW {target}                     | Perform TCP Window scan                                      |
| nmap -sM {target}                     | Perform TCP maimon scan                                      |
| nmap -sZ {target}                     | Perform SCTP INIT scan                                       |
| nmap -oN output.txt                   | Normal Output                                                |
| nmap -oX output.xml                   | XML Output                                                   |
| nmap -oG output.gnmap                 | Grepable Output                                              |
| nmap --append-output                  | Append scan results to an existing output file               |
| nmap --top-ports {number}             | Scans most common ports                                      |
| nmap -6 {target}                      | Performs IPv6 scan                                           |
| nmap -T4 {target}                     | Adjust Scan Speed                                            |
| nmap --version-all                    | Perform detailed version detection                           |
| nmap --traceroute {target}            | Perform traceroute to determine the route                    |
| nmap --max-retries {num}              | Set maximum retries for probe attempts                       |
| nmap --scan-delay {time}              | Set delay between packets during a scan                      |
| nmap --data-length {length}           | Adjust packet data length for probes                         |
| nmap --ttl {value}                    | Set TTL (Time-To-Live) value for packets                     |
| nmap -D {decoys} {target}             | Use decoys to hide the dource of the scan                    |
| nmap  --spoof-mac {MAC address}       | Spoof= the MAC address of the scanning machine               |
| nmap --exclude {target}               | Exclude specific targets from the scan                       |
| nmap --exclude-file {file}            | Exclude targets listed in a file                             |
| nmap --reason                         | Show reason for host or port state changes                   |
| nmap --badsum {target}                | Send packets with invalid checksums                          |
| nmap --randomize-hosts {target}       | Randomize the order of the hosts scanned                     |
| nmap --min-hostgroup {number}         | Set Minimum number of hosts in a scan group                  |
| nmap --max-hostgroup {number}         | Set Maximum number of hosts in a scan group                  |
| nmap --min-parallelism {number}       | Set MInimum number of parallel scans                         |
| nmap --max-parallelism {number}       | Set Maximum number of parallel scans                         |
| nmap --unprivileged                   | Run Nmap in unprivileged mode                                |
| nmap --send-ip                        | Use raw IP packets instead of higher-level protocols         |
| nmap --disable-arp-ping               | Disable ARP ping during host discovery                       |
| nmap --ip-options {options}           | Use specific IP options in packets                           |
| nmap --dns-servers {servers}          | Specify custom DNS servers for scans                         |
| nmap --resolve-all                    | Resolve all IPs before scanning                              |
| nmap --sript vuln {target}            | Run vulnerability detection scripts                          |
| nmap --script {script}                | Run a specific script                                        |
| nmap -sC {target}                     | Run default category scripts                                 |
| nmap --script-timeout {time}          | Set time out for scripts                                     |
| nmap --script=http-* {target}         | Run HTTP-related scripts                                     |
| nmap --script=ftp-anon {target}       | Check for anonymous FTP login                                |
| nmap --script=dns-cache-snoop         | Check DNS cache snooping vulnerabilities                     |
| nmap --script=http-stored-xss         | Check for stored XSS vulnerabilties                          |
| nmap --script=ssl-enum-ciphers        | Check SSL/TLS cipher suites                                  |
| nmap --script=http-robots.txt         | Retrieve and analyze robots.txt files                        |
| nmap --script=http-sitemap-generator  | Generate sitemaps for web applications                       |
| nmap --script=http-waf-detect         | Detect Web Application Firewalls                             |
| nmap --script=smb-vuln-ms08-067       | Check for SMB vulnerabilties like MS08-067                   |
| nmap --script=http-sql-injection      | Detect SQL injection vulnerabilities                         |
| nmap --script=http-userdir-enum       | Enumerate user directories on HTTP servers                   |
| nmap --script=http-shellshock         | Check for Shellshock vulnerabilities                         |
| nmap --script=mysql-empty-password    | Check for empty password vulnerabilities in MySQL            |
| nmap --script=http-vuln-cve-2020-3452 | Check for specific CVE vulnerability                         |
| nmap --script=ssh-auth-methods        | Enumerate support SSH authentication methods                 |
| nmap --script=firewalk                | Analyze firewall rules                                       |
| nmap --script=rdp-enum-encryption     | Enumerate RDP encryption settings                            |
| nmap --script=smb-enum-shares         | List SMB shared resources                                    |
| nmap --script=smb-enum-users          | Enumerate users on SMB systems                               |
| nmap --script=imap-capabilities       | Check capabilities of an IMAP server                         |
| nmap --script=pop3-capabilities       | Check capabilities of a POP3 server                          |
| nmap --script=http-auth               | Test HTTP authentication  methods                            |
| nmap --script=ssl-heartbleed          | Test for Heartbleed vulnerabilities in SSL/TLS               |
| nmap --script=ftp-bounce              | Check for FTP bounce vulnerability                           |
| nmap --script=ldap-rootdse            | Query LDAP RootDSE information                               |
| nmap --script=rdp-vuln-ms12-020       | Test for MS12-020 vulnerability in RDP                       |
| nmap --script=ntp-monlist             | Retrieve the list of recent connection from a NTP server     |
| nmap --script=snmp-brute              | Perform brute-force attacks on SNMP                          |
| nmap --script=ip-geolocation-*        | Retrieve geolocation data for scanned IP addresses           |
| nmap --script=dns-recursion           | Test if a DNS server allows recursion                        |
| nmap --script=dns-zone-transfer       | Test for DNS zone transfer vulnerabilities                   |
| nmap --script=dns-service-discovery   | Discover services running on DNS                             |
| nmap --script=tls-nextprotoneg        | Test Next Protocol Negotiation in TLS                        |
| nmap --script=ssl-cert-introspection  | Analyze SSL certificates in-depth                            |
| nmap --script=ntp-info                | Gather information about NTP servers                         |
| nmap --script=http-grep               | Search for specific patterns in HTTP responses               |
| nmap --script=smtp-commands           | Enumerate SMTP commands supported by a server                |
| nmap --script=vnc-info                | Gather information about VNC services                        |
| nmap --script=ftp-proftpd-backdoor    | Check for ProFTPD backdoor vulnerability                     |
| nmap --osscan-limit                   | Limit OS detection to promising targets                      |
| nmap --osscan-guess                   | Guess the operating system when detection is<br>inconclusive |
