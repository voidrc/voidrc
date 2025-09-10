## Network Layer

The **network layer (Layer 3)** of the **OSI model** manages the transmission of data packets, which cannot be sent directly to the recipient and therefore require intermediate routing through network nodes. These packets move from node to node until they reach their destination. To achieve this, the **network layer** identifies network nodes, establishes and terminates connections, and manages routing and data flow control. During transmission, it evaluates addresses and routes packets through the network accordingly. Typically, upper-layer data isn't processed by Layer 3 at each node. Routing decisions and routing table construction are based on address information.

In summary, it handles:
- Logical Addressing
- Routing

Each **OSI** layer uses specific protocols—sets of rules that govern communication within that layer. These protocols operate independently of other layers but some may span multiple layers. Common network layer protocols include:
- IPv4 / IPv6
- IPsec
- ICMP
- IGMP
- RIP
- OSPF    

Its role is to ensure packet delivery from source to destination across or within subnets, even if they use different or incompatible addressing methods. This involves routing data through the entire network, with routers forwarding packets node by node, often assigning them new intermediate targets. These forwarded packets don't reach higher OSI layers.

---

## IPv4 Addresses

Every device in a network can be identified by its **MAC address**, which allows for communication within a local network. However, connecting to a host in a different network requires more than a MAC address—this is where **IPv4** or **IPv6** addresses come into play. These addresses comprise a network part and a host part.

This applies to all networks—whether a local home network or the entire internet. The **IP address** ensures that data reaches the correct recipient. Think of it like this:

```
IPv4 / IPv6 - like the street address and neighborhood of the recipient.
MAC - like the specific apartment number.
```

An IP address can be used to reach one device (unicast), multiple devices (broadcast), or be assigned to a single device that responds to multiple addresses. It's crucial that each IP address is unique within its network.

### IPv4 Structure

The standard format for IP addresses is **IPv4**, consisting of 32 binary bits grouped into four 8-bit octets. These are converted to a human-readable **dotted-decimal** format, with each octet ranging from 0 to 255.

For example:

| Format  | Example                             |
| ------- | ----------------------------------- |
| Binary  | 01111111.00000000.00000000.00000001 |
| Decimal | 127.0.0.1                           |

Each device interface (e.g., computers, routers, printers) is assigned a unique IP address.

**IPv4** allows for over 4.2 billion unique addresses. Each address is divided into a network and host portion. At home, routers assign the host part; the network part is assigned by administrators or **IANA** globally.

Historically, IPv4 addresses were grouped into five classes:

| Class | Address Range               | Subnet Mask   | CIDR | Subnets   | Hosts        |
| ----- | --------------------------- | ------------- | ---- | --------- | ------------ |
| A     | 1.0.0.0 - 127.255.255.255   | 255.0.0.0     | /8   | 127       | 16,777,214+2 |
| B     | 128.0.0.0 - 191.255.255.255 | 255.255.0.0   | /16  | 16,384    | 65,534+2     |
| C     | 192.0.0.0 - 223.255.255.255 | 255.255.255.0 | /24  | 2,097,152 | 254+2        |
| D     | 224.0.0.0 - 239.255.255.255 | Multicast     | -    | -         | Multicast    |
| E     | 240.0.0.0 - 255.255.255.255 | Reserved      | -    | -         | Reserved     |

### Subnet Mask

Subnets are created using a **subnet mask**, which determines which bits of the IP address represent the network vs. the host.

Each class has a default mask:

| Class | Subnet Mask   | CIDR |
| ----- | ------------- | ---- |
| A     | 255.0.0.0     | /8   |
| B     | 255.255.0.0   | /16  |
| C     | 255.255.255.0 | /24  |

### Network and Gateway Addresses

Two additional reserved IPs in each subnet are for the **network address** and **broadcast address**. The **default gateway**—usually the first or last assignable IP—connects different networks and manages protocols and transmission.

---
## Subnetting

**Subnetting** breaks a larger address space into smaller ones called **subnets**.

A subnet is a portion of a network where all devices share the same network address. This enables organization and segmentation, like separating departments in a building.

Given:
- IPv4: 192.168.12.160
- Subnet Mask: 255.255.255.192
- CIDR: /26    

We analyze binary forms to identify the **network** and **host** parts. The subnet mask's 1-bits fix the network portion. Remaining bits allow for host addressing.

If:
- Network Address: 192.168.12.128
- Broadcast Address: 192.168.12.191
- Usable Hosts: 192.168.12.129–192.168.12.190
- Total Usable Hosts: 62 (64 - 2 for reserved)

To divide this into 4 subnets, increase the subnet mask from /26 to /28 (adds 2 bits).

| Subnet | Network Address | First Host | Last Host | Broadcast Address | CIDR |
| ------ | --------------- | ---------- | --------- | ----------------- | ---- |
| 1      | 192.168.12.128  | .129       | .142      | .143              | /28  |
| 2      | 192.168.12.144  | .145       | .158      | .159              | /28  |
| 3      | 192.168.12.160  | .161       | .174      | .175              | /28  |
| 4      | 192.168.12.176  | .177       | .190      | .191              | /28  |

### Mental Subnetting

Only the changing octet needs to be identified. For example, with 192.168.1.1/25, only the 4th octet can vary. To find host range:
- /25 = 2^7 = 128 addresses
- Range: 192.168.1.0–127 and 192.168.1.128–255 (next block)    

---

## MAC Addresses

Each device has a 48-bit **MAC address** identifying its network interface. Standards include:
- Ethernet (IEEE 802.3)
- Bluetooth (IEEE 802.15)    
- WLAN (IEEE 802.11)

Example formats:
- `DE:AD:BE:EF:13:37`
- `DE-AD-BE-EF-13-37`
- `DEAD.BEEF.1337`    

First 3 bytes (OUI) identify the manufacturer, the last 3 are NIC-specific. MACs can be spoofed but usually are fixed in hardware.

MAC address functions include unicast, multicast, and broadcast delivery. ARP resolves IP to MAC addresses.

---

## Address Resolution Protocol (ARP)

**ARP** translates IP addresses to MAC addresses for local communication. It works via broadcast requests and direct replies:

Example (ARP Request/Reply):
```
1   Who has 10.129.12.101? Tell 10.129.12.100  
2   10.129.12.101 is at AA:AA:AA:AA:AA:AA
```

ARP can be exploited via **spoofing**, where an attacker sends false responses to reroute traffic through their system.

---

## IPv6 Addresses

**IPv6**, the successor to IPv4, uses 128-bit addresses. Advantages include:
- Vast address space
- Autoconfiguration (SLAAC)
- Built-in IPsec
- No need for NAT
- Simplified header    
- Up to 4 GB packet size

Address types:
- **Unicast**: One-to-one
- **Anycast**: One-to-nearest
- **Multicast**: One-to-many
- (No broadcast in IPv6)

IPv6 uses hexadecimal representation and compression (e.g., `fe80::1`). The **prefix** denotes the network part; the **interface identifier** is often derived from the MAC address.

IPv6 Example:
- Full: `fe80:0000:0000:0000:dd80:b1a9:6687:2d3b/64`    
- Compressed: `fe80::dd80:b1a9:6687:2d3b/64`

IPv6 notation guidelines (RFC 5952):
- Use lowercase letters
- Remove leading zeros    
- Use `::` for long zero sequences (once only)
