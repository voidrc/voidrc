Hello everyone,  
  
We will be discussing on how to perform scans on specific target and get as much info as possible, before we proceed with exploitation part.  
  
Now, before we start with our scan, let's get into the scan types:  
  
There are two types of scanning  

1. Passive Scan - Using this one, you don't want to be recognized by the target in this regard, you don't directly contact the target systems just by watching a network traffic flow passive scanners can deduce a large amount of information about the communicating systems. Now speaking of which, I'd recommend you using either tcpdump or wireshark (this one is my favorite), to monitor the network traffic, looking at the ARP table in a computer which is connected to the network is another example of passive scanning.  
      
    
2. Active Scan - Scan the target systems, this requires more preparation for the attacker or pentester, because it leaves traces (a bit off-topic, I am always telling the same to people who searches for a tool that does everything for them, I'm more fan of a manual stuff in general, because overall scanners are noisy), which are likely to alert the target about your actions. Also the whole operation might be a huge headache for you, if its not done correctly, it can be an ineffective, inefficient way to gather information.  
    

  
Some tools you can use  

1. Nmap  
    
2. Bootymapper - Made by HF [member](https://hackforums.net/member.php?action=profile&uid=4504133), it is similar to nmap  
    
3. HPing - command line oriented TCP/IP packet analyser. Might look like a ping command, but this tool isn't able only to send ICMP echo requests (when i had my very first linux distro i always used hping, because it supports UDP,TCP,RAW and ICMP as i mentioned.  
    
4. Scapy - Packet manipulation program that forges or decode packets of a wide number of protocols, it sends them on the wire, capture them, match requests and replies.  
    
5. Traceroute - Simply just records the route thru the network between your computer and a specified destination computer.  
    

  
Now, let's see how to use hping to scan the network. It really depends what distro you are using, if it's penetration based, hping will most likely be embedded into it, in my case, I'm using Fedora and it's not. But let's keep on-topic.  
Spoiler (Click to Hide)If you use hping -h you will see detailed usage of hping3 commands, but as of now we will stick to scan mode (--scan)  
![[Image: RUeyMny.jpg]](https://i.imgur.com/RUeyMny.jpg)  
The first parameter is scan to use hping in scan mode, now we must say in which ports we are going to scan, in the picture above I'm scanning from 0 to 80. Or maybe you can give a port range like this with a - between the lower bound and the upper one, another way is to separate them by a comma. After that I set a SYN flag of the packet (Because all TCP connections start with a SYN packet.) then we proceed with the next argument which is our target (IP Address). Hit enter to start the scan  
![[Image: SRvGAiy.jpg]](https://i.imgur.com/SRvGAiy.jpg)  
Here we have the responding ports, and flags column says what the reply is. We sent SYN packets and get SYN-ACK packets, meaning the port is open and accessible to us.  
  
DISCLAIMER: This is for educational purposes only, don't use it for illegal activities.  
Now I'd like to show you how to perform an IP-Spoofed DoS using the same tool. Now I'm going to attack my own server, before that i need to ensure myself I'm having a connection.  
Spoiler (Click to Hide)  
![[Image: PJwiZkW.jpg]](https://i.imgur.com/PJwiZkW.jpg)  
Okay, now the first parameter should be --flood (That sends packets as fast as possible, now to make it a SYN flood attack, we should set a -S parameter, since it's a legitimate TCP handshake, the server will try to respond to all the packets at the start of the TCP communication) now we will use -V for verbose mode (meaning we are going to see the results of all the sent packets), then we are going for --rand-source (assuming by the name, this will randomize the source ip addresses as if they are requested by different systems). Now you have to give the target domain.  
![[Image: 4IazCjf.jpg]](https://i.imgur.com/4IazCjf.jpg) Now because we are in flood mode, no replies will be shown.  
Now you can try to browse some stuff and see the response time (it will be loading really slow). To stop the flood you simply have to press ctrl + c. After that you will see all the SYN packets being sent to the victim server.  
![[Image: tHxAN0o.jpg]](https://i.imgur.com/tHxAN0o.jpg)  
No packets will be recieved because we randomised the source address  
  
  
That was as of now, I'm heading out but i will edit the thread later on with some more content, such as IPSIDS evasion and timing scans.

Chains of habit are too light to be felt until they are too heavy to be broken.