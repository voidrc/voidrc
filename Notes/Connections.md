## Key Exchange Mechanisms
Key exchange methods are used to exchange [cryptographic keys](https://www.cloudflare.com/learning/ssl/what-is-a-cryptographic-key/) between two parties securely. This is an essential part of many cryptographic protocols, as the security of the encryption used to protect communication relies on the secrecy of the keys. There are many key exchange methods, each with unique characteristics and strengths. Some key exchange methods are more secure than others, and the appropriate method depends on the situation's specific circumstances and requirements.

These methods typically work by allowing the two parties to agree on a `shared secret key` over an insecure communication channel that encrypts the communication between them. This is generally done using some form of mathematical operation, such as a computation based on the properties of a mathematical function or a series of simple manipulations of the key.

#### Diffie-Hellman

One common key exchange method is the [Diffie-Hellman key exchange](https://www.comparitech.com/blog/information-security/diffie-hellman-key-exchange/), which allows two parties to agree on a shared secret key without any prior communication or shared private information. It is based on the concept of two parties generating a shared secret key that can be used to encrypt and decrypt messages between them. It is often used as the basis for establishing secure communication channels, such as in the [Transport Layer Security](https://www.cloudflare.com/learning/ssl/transport-layer-security-tls/) (`TLS`) protocol that is used to protect web traffic.

One of the main limitations of the `Diffie-Hellman` key exchange is that it is vulnerable to `MITM attacks`. In a MITM attack, we intercept the communication between the two parties and pretend to be one of the parties, generating a different secret key and tricking both parties into using it. This allows the attacker to read and modify the messages sent between the parties.

Another limitation is that it requires a relatively large amount of `CPU power` to generate the shared secret key. This can make it impractical for use in low-power devices or in situations where the key needs to be generated quickly.

#### RSA

Another key exchange method is the [Rivest–Shamir–Adleman](https://www.venafi.com/blog/how-diffie-hellman-key-exchange-different-rsa) (`RSA`) algorithm, which uses the properties of large prime numbers to generate a shared secret key. This method relies on the fact that it is relatively easy to multiply large prime numbers together but challenging to factor the resulting number back into its prime factors. Besides these two, there are also a couple of others that we need to look at. It is also widely used in many other applications and protocols that require secure communication and data protection, including but not limited to:

- Encrypting and signing messages to provide confidentiality and authentication
    
- Protecting data in transit over networks, such as in the [Secure Socket Layer](https://www.cloudflare.com/learning/ssl/what-is-ssl/) (`SSL`) and `TLS` protocols
    
- Generating and verifying digital signatures, which are used to provide authenticity and integrity for electronic documents and other digital data
    
- Authenticating users and devices, such as in the [Public Key Cryptography for Initial Authentication in Kerberos](https://www.ietf.org/rfc/rfc4556.txt) (`PKINIT`) protocol used by the Kerberos network authentication system
    
- Protecting sensitive information, such as in the encryption of personal data and confidential documents
    

#### ECDH

[Elliptic curve Diffie-Hellman](https://medium.com/swlh/understanding-ec-diffie-hellman-9c07be338d4a) (`ECDH`) is a variant of Diffie-Hellman key exchange that uses elliptic curve cryptography to generate the shared secret key. It has the advantage of being more efficient and secure than the original Diffie-Hellman algorithm, including but not limited to:

- Establishing secure communication channels, such as in the `TLS` protocol
    
- Providing forward secrecy, which ensures that past communications cannot be revealed even if the private keys are compromised
    
- Authenticating users and devices, such as in the [Internet Key Exchange](https://docs.oracle.com/cd/E19683-01/816-7264/6md9iem1g/index.html) (`IKE`) protocol used in VPNs
    

#### ECDSA

The [Elliptic Curve Digital Signature Algorithm](https://www.hypr.com/security-encyclopedia/elliptic-curve-digital-signature-algorithm) (`ECDSA`) uses elliptic curve cryptography to generate digital signatures that can authenticate the parties involved in the key exchange.

Let us summarize and compare these algorithms:

| **Algorithm**                                | **Acronym** | **Security**                                                               |
| -------------------------------------------- | ----------- | -------------------------------------------------------------------------- |
| `Diffie-Hellman`                             | `DH`        | Relatively secure and computationally efficient                            |
| `Rivest–Shamir–Adleman`                      | `RSA`       | Widely used and considered secure, but computationally intensive           |
| `Elliptic Curve Diffie-Hellman`              | `ECDH`      | Provides enhanced security compared to traditional Diffie-Hellman          |
| `Elliptic Curve Digital Signature Algorithm` | `ECDSA`     | Provides enhanced security and efficiency for digital signature generation |

### Internet Key Exchange

[Internet Key Exchange](https://www.hypr.com/security-encyclopedia/internet-key-exchange) (`IKE`) is a protocol used to establish and maintain secure communication sessions, such as those used in VPNs. It uses a combination of the `Diffie-Hellman` key exchange algorithm and `other cryptographic techniques` to securely exchange keys and negotiate security parameters. Besides, it is a key component of many VPN solutions, as it enables the secure exchange of keys and other security information between the VPN client and server. This allows the VPN to establish an encrypted tunnel through which data can be transmitted securely.

IKE can also be used for other purposes, such as in the authentication of users and devices. It is typically used in conjunction with other protocols and algorithms, such as the RSA algorithm for key exchange and digital signatures, and the [Advanced Encryption Standard](https://www.geeksforgeeks.org/advanced-encryption-standard-aes/) (`AES`) for data encryption.

IKE operates either in `main mode` or `aggressive mode`. These modes determine the sequence and parameters of the key exchange process and can affect the security and performance of the IKE session.

#### Main Mode

The `main mode` is the default mode for `IKE` and is generally considered `more secure` than the aggressive mode. The key exchange process is performed in `three phases` in the main mode, each exchanging a different set of security parameters and keys. This allows for greater flexibility and security but can also result in slower performance compared to aggressive mode.

#### Aggressive Mode

`Aggressive mode` is an alternative mode for `IKE` that provides `faster performance` by reducing the number of round trips and message exchanges required for key exchange. In this mode, the key exchange process is performed in `two phases`, with all security parameters and keys being exchanged in the first phase. However, this can provide faster performance but may also reduce the security of the IKE session compared to the main mode since the `aggressive mode` does not provide identity protection.

#### Pre-Shared Keys

In IKE, a `Pre-Shared Key` (`PSK`) is a secret value shared between the two parties involved in the key exchange. This key is used to authenticate the parties and establish a shared secret that encrypts subsequent communication. The use of a PSK is optional in IKE, and whether or not to use one depends on the specific requirements and constraints of the situation. However, if a `PSK` is used, it must be securely exchanged between the two parties before the key exchange process begins. This can be done through a secure out-of-band channel, such as a separate communication channel, or by physically exchanging the key.

The main advantage of using a PSK is that it provides an additional layer of security by allowing the parties to authenticate with each other. However, using a PSK also has some limitations and drawbacks. For example, it can be difficult to exchange the key securely, and if the key is compromised through a MITM attack, the security of the IKE session may be compromised.

---

## Authentication Protocols
Many different authentication protocols are used in networking to verify the identity of devices and users. Those protocols are essential because they provide a secure and standardized way of `verifying the identity` of users, devices, and other entities in a network. Without authentication protocols, it would be difficult to securely and reliably identify entities in a network, making it easy for attackers to gain unauthorized access and potentially compromise the network.

Authentication protocols also provide a means for `securely exchanging information` between entities in a network which we will discuss briefly. This is important for ensuring the confidentiality and integrity of sensitive data and preventing unauthorized access and other security threats. Let us take a look at a few most commonly used authentication protocols:

|**Protocol**|**Description**|
|---|---|
|`Kerberos`|Key Distribution Center (KDC) based authentication protocol that uses tickets in domain environments.|
|`SRP`|This is a password-based authentication protocol that uses cryptography to protect against eavesdropping and man-in-the-middle attacks.|
|`SSL`|A cryptographic protocol used for secure communication over a computer network.|
|`TLS`|TLS is a cryptographic protocol that provides communication security over the internet. It is the successor to SSL.|
|`OAuth`|An open standard for authorization that allows users to grant third-party access to their web resources without sharing their passwords.|
|`OpenID`|OpenID is a decentralized authentication protocol that allows users to use a single identity to sign in to multiple websites.|
|`SAML`|Security Assertion Markup Language is an XML-based standard for securely exchanging authentication and authorization data between parties.|
|`2FA`|An authentication method that uses a combination of two different factors to verify a user's identity.|
|`FIDO`|The Fast IDentity Online Alliance is a consortium of companies working to develop open standards for strong authentication.|
|`PKI`|PKI is a system for securely exchanging information based on the use of public and private keys for encryption and digital signatures.|
|`SSO`|An authentication method that allows a user to use a single set of credentials to access multiple applications.|
|`MFA`|MFA is an authentication method that uses multiple factors, such as something the user knows (a password), something the user has (a phone), or something the user is (biometric data), to verify their identity.|
|`PAP`|A simple authentication protocol that sends a user's password in clear text over the network.|
|`CHAP`|An authentication protocol that uses a three-way handshake to verify a user's identity.|
|`EAP`|A framework for supporting multiple authentication methods, allowing for the use of various technologies to verify a user's identity.|
|`SSH`|This is a network protocol for secure communication between a client and a server. We can use it for remote command-line access and remote command execution, as well as for secure file transfer. SSH uses encryption to protect against eavesdropping and other attacks and can also be used for authentication.|
|`HTTPS`|This is a secure version of the HTTP protocol used for communication on the internet. HTTPS uses SSL/TLS to encrypt communication and provide authentication, ensuring that third parties cannot intercept and read the transmitted data. It is widely used for secure communication over the internet, particularly for web browsing.|
|`LEAP`|LEAP is a wireless authentication protocol developed by Cisco. It uses EAP to provide mutual authentication between a wireless client and a server and uses the RC4 encryption algorithm to encrypt communication between the two. Unfortunately, LEAP is vulnerable to dictionary attacks and other security vulnerabilities and has been largely replaced by more secure protocols such as EAP-TLS and PEAP.|
|`PEAP`|PEAP on the other hand is a secure tunneling protocol used for wireless and wired networks. It is based on EAP and uses TLS to encrypt communication between a client and a server. PEAP uses a server-side certificate to authenticate the server and can also be used to authenticate the client using various methods, such as passwords, certificates, or biometric data. PEAP is widely used in enterprise networks for secure authentication.|

For example, LEAP and PEAP may be used to authenticate wireless clients when they access the wireless network or to authenticate remote employees connecting to the network via a VPN. In these cases, using SSH or HTTPS would be challenging to implement, as they are designed for different purposes. In terms of security, `PEAP` is generally more secure than LEAP because it uses a server-side public key certificate to authenticate the server and encrypting `MSCHAPv2` hash, while `LEAP` relies on a shared secret that is negotiated between the client and the server and does `not` encrypt `MSCHAPv2` hashes. PEAP also supports the use of stronger encryption algorithms, such as AES and 3DES, for encrypting the authentication information, whereas LEAP uses the weaker RC4 algorithm.

However, both protocols are vulnerable to specific attacks and have been largely replaced by more secure protocols such as EAP-TLS.

As physical connections, protocols with `SSL` or `TLS` are used by default, such as `SSH` or `HTTPS`. Both protocols use robust encryption algorithms to protect the authentication information transmitted between the client and the server. This helps to prevent interception or to tamper the authentication data, which is essential for maintaining the security of the authentication process. Also, they support using digital certificates and `PKI` for authenticating the server to the client. This ensures that the client can verify the server's identity and helps to prevent MITM attacks. SSH and HTTPS are widely used and well-supported protocols, with implementations available for various operating systems and devices and makes them easy to use and deploy in a variety of environments.

---

## TCP/UDP Connections
[Transmission Control Protocol](https://en.wikipedia.org/wiki/Transmission_Control_Protocol) (`TCP`) and [User Datagram Protocol](https://en.wikipedia.org/wiki/User_Datagram_Protocol) (`UDP`) are both protocols used in information and data transmission on the Internet. Typically, TCP connections transmit important data, such as web pages and emails. In contrast, UDP connections transmit real-time data such as streaming video or online gaming.

`TCP` is a connection-oriented protocol that ensures that all data sent from one computer to another is received. It is like a telephone conversation where both parties remain connected until the call is terminated. If an error occurs while sending data, the receiver sends a message back so the sender can resend the missing data. This makes `TCP` reliable and slower than UDP because more time is required for transmission and error recovery.

`UDP`, on the other hand, is a connectionless protocol. It is used when speed is more important than reliability, such as for video streaming or online gaming. With `UDP`, there is no verification that the received data is complete and error-free. If an error occurs while sending data, the receiver will not receive this missing data, and no message will be sent back to resend it. Some data may be lost with `UDP`, but the overall transmission is faster.

### IP Packet

An [Internet Protocol](https://en.wikipedia.org/wiki/Internet_Protocol) (`IP`) packet is the data area used by the network layer of the [Open Systems Interconnection](https://en.wikipedia.org/wiki/OSI_model) (`OSI`) model to transmit data from one computer to another. It consists of a header and the payload, the actual payload data.

We can also think of the IP packet as a letter sent in an envelope. The envelope contains the header, which includes information on the sender and the recipient, as well as instructions for routing the letter, i.e., via which post offices the letter should be sent. The letter itself is the payload, the actual payload data.

#### IP header

The header of an IP packet contains several fields that have important information.

| **Field**                | **Description**                                                                |
| ------------------------ | ------------------------------------------------------------------------------ |
| `Version`                | Indicates which version of the IP protocol is being used                       |
| `Internet Header Length` | Indicates the size of the header in 32-bit words                               |
| `Class of Service`       | Means how important the transmission of the data is                            |
| `Total length`           | Specifies the total length of the packet in bytes                              |
| `Identification (ID)`    | Is used to identify fragments of the packet when fragmented into smaller parts |
| `Flags`                  | Used to indicate fragmentation                                                 |
| `Fragment Offset`        | Indicates where the current fragment is placed in the packet                   |
| `Time to Live`           | Specifies how long the packet may remain on the network                        |
| `Protocol`               | Specifies which protocol is used to transmit the data, such as TCP or UDP      |
| `Checksum`               | Is used to detect errors in the header                                         |
| `Source/Destination`     | Indicate where the packet was sent from and where it is being sent to          |
| `Options`                | Contain optional information for routing                                       |
| `Padding`                | Pads the packet to a full word length                                          |

We may see a computer with multiple IP addresses in different networks. Here we should pay attention to the `IP ID` field. It is used to identify fragments of an IP packet when fragmented into smaller parts. It is a `16-bit` field with a unique number ranging from `0-65535`.

If a computer has multiple IP addresses, the `IP ID` field will be different for each packet sent from the computer but very similar. In TCPdump, the network traffic might look something like this:

#### Network Sniffing

TCP/UDP Connections

```shell-session
IP 10.129.1.100.5060 > 10.129.1.1.5060: SIP, length: 1329, id 1337
IP 10.129.1.100.5060 > 10.129.1.1.5060: SIP, length: 1329, id 1338
IP 10.129.1.100.5060 > 10.129.1.1.5060: SIP, length: 1329, id 1339
IP 10.129.2.200.5060 > 10.129.1.1.5060: SIP, length: 1329, id 1340
IP 10.129.2.200.5060 > 10.129.1.1.5060: SIP, length: 1329, id 1341
IP 10.129.2.200.5060 > 10.129.1.1.5060: SIP, length: 1329, id 1342
```

We can see from the output that two different IP addresses are sending packets to IP address 10.129.1.1. However, from the `IP ID`, we can see that the packets are continuous. This strongly indicates that the two IP addresses belong to the same host in the network.

#### IP Record-Route Field

The `Record-Route field` in the IP header also records the route to a destination device. When the destination device sends back the `ICMP Echo Reply` packet, the IP addresses of all devices that pass through the packet are listed in the `Record-Route field` of the IP header. This happens when we use the following command, for example:

TCP/UDP Connections

```shell-session
VOIDstrike@htb[/htb]$ ping -c 1 -R 10.129.143.158

PING 10.129.143.158 (10.129.143.158) 56(124) bytes of data.
64 bytes from 10.129.143.158: icmp_seq=1 ttl=63 time=11.7 ms
RR: 10.10.14.38
        10.129.0.1
        10.129.143.158
        10.129.143.158
        10.10.14.1
        10.10.14.38


--- 10.129.143.158 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 11.688/11.688/11.688/0.000 ms
```

The output indicates that a `ping` request was sent and a response was received from the destination device and also shows the `Record-Route field` in the IP header of the `ICMP Echo Request` packet. The Record Route field contains the IP addresses of all devices that passed through the `ICMP Echo Request` packet on the way to the destination device. In this case, the `Record-Route field` contains the IP addresses:


| 10.10.14.38    | 10.129.0.1 | 10.129.143.158 |
| -------------- | ---------- | -------------- |
| 10.129.143.158 | 10.10.14.1 | 10.10.14.38    |

The `traceroute` tool can also be used to trace the route to a destination more accurately, which uses the TCP timeout method to determine when the route has been fully traced.

1. We send a TCP SYN packet to the destination device with a TTL of 1 in the IP header.

    When the TCP SYN packet with a TTL greater than 1 reaches a router, the value of the TTL is decreased by 1, and the packet is forwarded to the next device. If the TCP SYN packet with a TTL of 1 reaches a router, the packet is dropped, and the router sends an ICMP Time-Exceeded packet back to us.
    
2. We receive the ICMP Time-Exceeded packet and note the IP address of the router that sent the packet.
    
3. After that, we send another TCP SYN packet to the destination, increasing the TTL by 1.
    

The process repeats until the TCP SYN packet reaches the destination host and receives a `TCP SYN/ACK` or a `TCP RST` response from the target. Once we receive a response from the destination device, we know that we have traced the route to the destination and ended the traceroute process.

#### IP Payload

The payload (also referred to as `IP Data`) is the actual payload of the packet. It contains the data from various protocols, such as TCP or UDP, that are being transmitted, just like the contents of the letter in the envelope.

### TCP

TCP packets, also known as `segments`, are divided into several sections called headers and payloads. The TCP segments are wrapped in the sent IP packet.

The header contains several fields that contain important information. The source port indicates the computer from which the packet was sent. The destination port indicates to which computer the packet is sent. The sequence number indicates the order in which the data was sent. The confirmation number is used to confirm that all data was received successfully. The control flags indicate whether the packet marks the end of a message, whether it is an acknowledgment that data has been received, or whether it contains a request to repeat data. The window size indicates how much data the receiver can receive. The checksum is used to detect errors in the header and payload. The Urgent Pointer alerts the receiver that important data is in the payload.

The payload is the actual payload of the packet and contains the data that is being transmitted, just like the content of a conversation between two people.

### UDP

UDP transfers `datagrams` (small data packets) between two hosts. It is a connectionless protocol, meaning it does `not` need to establish a connection between the sender and the receiver before sending data. Instead, the data is sent directly to the target host without any prior connection.

When `traceroute` is used with UDP, we will receive a `Destination Unreachable` and `Port Unreachable` message when the UDP datagram packet reaches the target device. Generally, UDP packets are sent using `traceroute` on Unix hosts.

### Blind Spoofing

`Blind spoofing`, is a method of data manipulation attack in which an attacker sends false information on a network without seeing the actual responses sent back by the target devices. It involves manipulating the IP header field to indicate false source and destination addresses. For example, we send a TCP packet to the target host with false source and destination port numbers and a false `Initial Sequence Number` (`ISN`). The `ISN` is a field in the TCP header that is used to specify the sequence number of the first TCP packet in a connection. The ISN is set by the sender of a TCP packet and sent to the receiver in the TCP header of the first packet. This can cause the target host to establish a connection with us without receiving the connection.

This attack is commonly used to disrupt the integrity of network connections or to break connections between network devices. It can also be used to monitor network traffic or to intercept information sent by network devices.

---

### Cryptography
Encryption is used on the Internet to transmit data, such as payment information, e-mails, or personal data, confidentially and protected against manipulation. Data is encrypted using various cryptographic algorithms based on mathematical operations. With the help of encryption, data can be transformed into a form that unauthorized persons can no longer read. Digital keys in `symmetric` or `asymmetric` encryption processes are used for encryption. It is easier to crack cipher texts or keys depending on the encryption methods used. If state-of-the-art cryptographic methods with extensive key lengths are used, they work very securely and are almost impossible to compromise for the time being. In principle, we can distinguish between `symmetric` and `asymmetric` encryption techniques. Asymmetric methods have only been known for a few decades. Nevertheless, they are the most frequently used methods in digital communication.

#### Symmetric Encryption

Symmetric encryption, also known as secret key encryption, is a method that uses the same key to encrypt and decrypt the data. This means the sender and the receiver must have the same key to decrypt the data correctly.

If the secret key is shared or lost, the security of the data is no longer guaranteed. Critical actions for symmetric encryption methods represent the distribution, storage, and exchange of the keys. [Advanced Encryption Standard](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard) (`AES`) and [Data Encryption Standard](https://en.wikipedia.org/wiki/Data_Encryption_Standard) (`DES`) are examples of symmetric encryption algorithms. This type of encryption is often used to encrypt large amounts of data, such as files on a hard drive or data sent over a network. `AES` is considered to be the most secure encryption algorithm nowadays.

#### Asymmetric Encryption

Asymmetric encryption, also known as `public-key encryption`, is a method of encryption that uses two different keys:

- a `public key`
- a `private key`

The public key is used to encrypt the data, while the private key is used to decrypt the data. This means anyone can use a public key to encrypt data for someone, but only the recipient with the associated private key can decrypt the data. Examples of asymmetric encryption methods include [Rivest–Shamir–Adleman](https://en.wikipedia.org/wiki/RSA_\(cryptosystem\)) (`RSA`), [Pretty Good Privacy](https://en.wikipedia.org/wiki/Pretty_Good_Privacy) (`PGP`), and [Elliptic Curve Cryptography](https://en.wikipedia.org/wiki/Elliptic-curve_cryptography) (`ECC`). Asymmetric encryption is used in a variety of applications, some of which include:

| E-Signatures | SSL/TLS | VPNs  |
| ------------ | ------- | ----- |
| SSH          | PKI     | Cloud |

### Public-Key Encryption

One advantage of asymmetric encryption is its `security`. Since the security is based on very hard-to-solve mathematical problems, simple attacks cannot crack it. Furthermore, the issue of key exchange is bypassed. This is a significant problem with symmetric encryption methods. However, since the public key can be accessible to everyone, there is no need to exchange keys secretly. In addition, the asymmetric methods open up the possibility of authentication with digital signatures.

### Data Encryption Standard

DES is a symmetric-key block cipher, and its encryption works as a combination of the one-time pad, permutation, and substitution ciphers applied to bit sequences. It uses the `same key` in both `encrypting and decrypting` data.

The key consists of `64 bits`, with `8 bits` used as a checksum. Therefore, the actual key length of DES is only `56 bits`. And that is why one always speaks of a key length of 56 bits when referring to DES. To prevent the danger from frequency analysis, not single letters, but each 64-bit block of plaintext is encrypted to a 64-bit block of ciphertext.

An extension of DES is the so-called [Triple DES / 3DES](https://en.wikipedia.org/wiki/Triple_DES), which encrypts data more securely. The procedure for this usually consists of three keys, with the first key being used to encrypt the data, the second to decrypt the data, and the third to encrypt the data again.

`3DES` was considered more secure than the original DES because it provides greater security using three rounds of encryption, although using a 56-bit key still limits it. `AES`, the successor to DES, provides higher security using longer key lengths and is now the most widely used symmetric encryption technology.

### Advanced Encryption Standard

Compared to DES, AES uses 128-bit (`AES-128`), 192-bit (`AES-192`), or 256-bit (`AES-256`) keys to encrypt and decrypt data. In addition, AES is faster than DES because it has a more efficient algorithm structure. This is because it can be applied to multiple data blocks at once, making it faster. This means that AES encryption and decryption can be performed faster than DES, which is especially important when large amounts of data need to be encrypted.

For example, we can find AES in many different applications and protocols, but they are not limited to:

| WLAN IEEE 802.11i | IPsec | SSH     |
| ----------------- | ----- | ------- |
| VoIP              | PGP   | OpenSSL |

### Cipher Modes

A cipher mode refers to how a block cipher algorithm encrypts a plaintext message. A block cipher algorithm encrypts data, each using fixed-size blocks of data (usually 64 or 128 bits). A cipher mode defines how these blocks are processed and combined to encrypt a message of any length. There are several common cipher modes, including:

|**Cipher Mode**|**Description**|
|---|---|
|[Electronic Code Book](https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation) (`ECB`) mode|ECB mode is generally not recommended for use due to its susceptibility to certain types of attacks. Furthermore, it does not hide data patterns efficiently. As a result, statistical analysis can reveal elements of clear-text messages, for example, in web applications.|
|[Cipher Block Chaining](https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation#CBC) (`CBC`) mode|CBC mode is generally used to encrypt messages like disk encryption and e-mail communication. This is the default mode for AES and is also used in software like TrueCrypt, VeraCrypt, TLS, and SSL.|
|[Cipher Feedback](https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation#Cipher_feedback_\(CFB\)) (`CFB`) mode|CFB mode is well suited for real-time encryption of a data stream, e.g., network communication encryption or encryption/decryption of files in transit like Public-Key Cryptography Standards (PKCS) and Microsoft's BitLocker.|
|[Output Feedback](https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation#OFB) (`OFB`) mode|OFB mode is also used to encrypt a data stream, e.g., to encrypt real-time communication. However, this mode is considered better for the data stream because of how the key stream is generated. We can find this mode in PKCS but also in the SSH protocol.|
|[Counter](https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation#CTR) (`CTR`) mode|CTR mode encrypts real-time data streams AES uses, e.g., network communication, disk encryption, and other real-time scenarios where data is processed. An example of this would be IPsec or Microsoft's BitLocker.|
|[Galois/Counter](https://en.wikipedia.org/wiki/Galois/Counter_Mode) (`GCM`) mode|GCM is used in cases where confidentiality and integrity need to be protected together, such as wireless communications, VPNs, and other secure communication protocols.|

Each mode has its characteristics and is more suitable for certain use cases. The choice of encryption mode depends on the application's requirements and the security objectives to be achieved.
