Linux, as you might already know, is an operating system used for personal computers, servers, and even mobile devices. However, Linux stands as a fundamental pillar in cybersecurity, renowned for its robustness, flexibility, and open-source nature. In this section we are going to cover the essential knowledge for any cybersecurity professional. You can think of this as your first driving lesson for a new car, getting a basic understanding of the vehicle, what it consists of, and why it is the way it currently is.

To begin, let's define what Linux is. Linux is an operating system, just like Windows, macOS, iOS, or Android. An operating system (OS) is software that manages all the hardware resources of a computer, facilitating communication between software applications and hardware components. Unlike some other operating systems, Linux comes in many different distributions—often called "distros"—which are versions of Linux tailored to various needs and preferences.

---

## Philosophy

The Linux philosophy centers on simplicity, modularity, and openness. It advocates for building small, single-purpose programs that perform one task well. These programs can be combined in various ways to accomplish complex operations, promoting efficiency and flexibility. Linux follows five core principles:

|**Principle**|**Description**|
|---|---|
|`Everything is a file`|All configuration files for the various services running on the Linux operating system are stored in one or more text files.|
|`Small, single-purpose programs`|Linux offers many different tools that we will work with, which can be combined to work together.|
|`Ability to chain programs together to perform complex tasks`|The integration and combination of different tools enable us to carry out many large and complex tasks, such as processing or filtering specific data results.|
|`Avoid captive user interfaces`|Linux is designed to work mainly with the shell (or terminal), which gives the user greater control over the operating system.|
|`Configuration data stored in a text file`|An example of such a file is the `/etc/passwd` file, which stores all users registered on the system.|

---

## Components

| **Component**     | **Description**                                                                                                                                                                                                                                                                                                                                 |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Bootloader`      | A piece of code that runs to guide the booting process to start the operating system.                                                                                                                                                                                                                                                           |
| `OS Kernel`       | The kernel is the main component of an operating system. It manages the resources for system's I/O devices at the hardware level.                                                                                                                                                                                                               |
| `Daemons`         | Background services are called "daemons" in Linux. Their purpose is to ensure that key functions such as scheduling, printing, and multimedia are working correctly. These small programs load after we booted or log into the computer.                                                                                                        |
| `OS Shell`        | The operating system shell or the command language interpreter (also known as the command line) is the interface between the OS and the user. This interface allows the user to tell the OS what to do. The most commonly used shells are Bash, Tcsh/Csh, Ksh, Zsh, and Fish.                                                                   |
| `Graphics server` | This provides a graphical sub-system (server) called "X" or "X-server" that allows graphical programs to run locally or remotely on the X-windowing system.                                                                                                                                                                                     |
| `Window Manager`  | Also known as a graphical user interface (GUI). There are many options, including GNOME, KDE, MATE, Unity, and Cinnamon. A desktop environment usually has several applications, including file and web browsers. These allow the user to access and manage the essential and frequently accessed features and services of an operating system. |
| `Utilities`       | Applications or utilities are programs that perform particular functions for the user or another program.                                                                                                                                                                                                                                       |

---

## Linux Architecture

The Linux operating system can be broken down into layers:

|**Layer**|**Description**|
|---|---|
|`Hardware`|Peripheral devices such as the system's RAM, hard drive, CPU, and others.|
|`Kernel`|The core of the Linux operating system whose function is to virtualize and control common computer hardware resources like CPU, allocated memory, accessed data, and others. The kernel gives each process its own virtual resources and prevents/mitigates conflicts between different processes.|
|`Shell`|A command-line interface (**CLI**), also known as a shell that a user can enter commands into to execute the kernel's functions.|
|`System Utility`|Makes available to the user all of the operating system's functionality.|

---

## File System Hierarchy

The Linux operating system is structured in a tree-like hierarchy and is documented in the [Filesystem Hierarchy](http://www.pathname.com/fhs/) Standard (FHS). Linux is structured with the following standard top-level directories:

![Diagram of Linux file system hierarchy with root directory branching to folders: /bin, /boot, /dev, /etc, /lib, /media, /mnt, /opt, /home, /run, /root, /proc, /sys, /tmp, /usr, /var.](https://academy.hackthebox.com/storage/modules/18/NEW_filesystem.png)

| **Path** | **Description**                                                                                                                                                                                                                                                                                                                    |
| -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `/`      | The top-level directory is the root filesystem and contains all of the files required to boot the operating system before other filesystems are mounted, as well as the files required to boot the other filesystems. After boot, all of the other filesystems are mounted at standard mount points as subdirectories of the root. |
| `/bin`   | Contains essential command binaries.                                                                                                                                                                                                                                                                                               |
| `/boot`  | Consists of the static bootloader, kernel executable, and files required to boot the Linux OS.                                                                                                                                                                                                                                     |
| `/dev`   | Contains device files to facilitate access to every hardware device attached to the system.                                                                                                                                                                                                                                        |
| `/etc`   | Local system configuration files. Configuration files for installed applications may be saved here as well.                                                                                                                                                                                                                        |
| `/home`  | Each user on the system has a subdirectory here for storage.                                                                                                                                                                                                                                                                       |
| `/lib`   | Shared library files that are required for system boot.                                                                                                                                                                                                                                                                            |
| `/media` | External removable media devices such as USB drives are mounted here.                                                                                                                                                                                                                                                              |
| `/mnt`   | Temporary mount point for regular filesystems.                                                                                                                                                                                                                                                                                     |
| `/opt`   | Optional files such as third-party tools can be saved here.                                                                                                                                                                                                                                                                        |
| `/root`  | The home directory for the root user.                                                                                                                                                                                                                                                                                              |
| `/sbin`  | This directory contains executables used for system administration (binary system files).                                                                                                                                                                                                                                          |
| `/tmp`   | The operating system and many programs use this directory to store temporary files. This directory is generally cleared upon system boot and may be deleted at other times without any warning.                                                                                                                                    |
| `/usr`   | Contains executables, libraries, man files, etc.                                                                                                                                                                                                                                                                                   |
| `/var`   | This directory contains variable data files such as log files, email in-boxes, web application related files, cron files, and more.                                                                                                                                                                                                |

---

## Distributions

Linux distributions - or distros - are operating systems based on the Linux kernel. They are used for various purposes, from servers and embedded devices to desktop computers and mobile phones. Linux distributions are like different branches or franchises of the same company, each tailored to serve specific markets or customer preferences. While they all share the same dedicated employees (components), organizational structure (architecture), and corporate culture (philosophy), each distribution offers its own unique products and services (software packages and configurations), customizing the experience to meet diverse needs—all while operating under the unified brand and values of Linux. Each Linux distribution is different, with its own set of features, packages, and tools. Some popular examples include:

	Arch
    Ubuntu
    Fedora
    CentOS
    Debian
    Red Hat Enterprise Linux

Many users choose Linux for their desktop computers because it is free, open source, and highly customizable. Ubuntu and Fedora are two popular choices for desktop Linux and beginners. It is also widely used as a server operating system because it is secure, stable, and reliable and comes with frequent and regular updates. Finally, we, as cybersecurity specialists, often prefer Linux because it is open source, meaning its source code is available for scrutiny and customization. Because of such customization, we can optimize and customize our Linux distribution the way we want and configure it for specific use cases only if necessary.

We can use those distros everywhere, including (web) servers, mobile devices, embedded systems, cloud computing, and desktop computing. For cyber security specialists, some of the most popular Linux distributions are but are not limited to:

	Arch
	BlackArch
	AthenaOS
	ParrotOS
	Kali
	Ubuntu
	Debian
	Raspberry Pi OS
	CentOS
	BackBox
	Pentoo

The main differences between the various Linux distributions are the included packages, the user interface, and the tools available. Kali Linux is the most popular distribution for cyber security specialists, including a wide range of security-focused tools and packages. Ubuntu is widespread for desktop users, while Debian is popular for servers and embedded systems. Finally, red Hat Enterprise Linux and CentOS are popular for enterprise-level computing. Arch is known with its minimalism.

---
## CLI

It is crucial to learn how to use the Linux shell, as there are many servers based on Linux. These are often used because Linux is less error-prone as opposed to Windows servers. For example, web servers are often based on Linux. Knowing how to use the operating system to control it effectively requires understanding and mastering Linux's essential part, the `Shell`. When we first switched from Windows to Linux, does it look something like this:

![Terminal](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic.packt-cdn.com%2Fproducts%2F9781788995597%2Fgraphics%2F8bbeb109-b258-49ae-954a-c16e03c5cd55.png&f=1&nofb=1&ipt=059644b870a4499d4d3b9a4c682df7aa3d79586c13bf44969f0a1f73340e3bf9)

A Linux terminal, also called a `shell` or command line, provides a text-based input/output (I/O) interface between users and the kernel for a computer system. The term console is also typical but does not refer to a window but a screen in text mode. In the terminal window, commands can be executed to control the system.

We can think of a shell as a text-based GUI in which we enter commands to perform actions like navigating to other directories, working with files, and obtaining information from the system but with way more capabilities.

---

## Terminal Emulators

Terminal emulation is software that emulates the function of a terminal. It allows the use of text-based programs within a graphical user interface (`GUI`). There are also so-called command-line interfaces (`CLI`) that run as additional terminals in one terminal. In short, a terminal serves as an interface to the shell interpreter.

Imagine you're in a large office building where the shell is the main server room that processes all the company's data and commands. The terminal is like a receptionist's desk that serves as a point of communication to the server room. You go to the receptionist (terminal) to deliver instructions or requests to the server room (shell).

Now, suppose you're working remotely. Terminal emulation software acts like a virtual receptionist's desk on your computer screen (the GUI), allowing you to interact with the server room without being physically present in the office. It emulates the function of the actual receptionist's desk, enabling you to use text-based programs and commands within a graphical environment.

Additionally, `command-line interfaces` (`CLI`) that run as additional terminals within one terminal are like having multiple virtual receptionist desks open on your screen simultaneously. Each one allows you to send different instructions to the server room independently, but through the same main interface. In essence, the terminal serves as your gateway to communicate with and control the core operations managed by the shell.

Terminal emulators and multiplexers are beneficial extensions for the terminal. They provide us with different methods and functions to work with the terminal, such as splitting the terminal into one window, working in multiple directories, creating different workspaces, and much more. An example of the use of such a multiplexer called Tmux could look something like this:

![Terminal window with three panes showing file listings for directories: BloodHound, Impacket, and SecLists. Each pane displays various files and directories under the user's home directory 'cry0l1t3' on the 'master' branch.](https://academy.hackthebox.com/storage/modules/18/tmux.png)

---

## Shell

The most commonly used shell in Linux is the `Bourne-Again Shell` (`BASH`), and is part of the GNU project. Everything we do through the GUI we can do with the shell. The shell gives us many more possibilities to interact with programs and processes to get information faster. Besides, many processes can be easily automated with smaller or larger scripts that make manual work much easier.

Besides Bash, there also exist other shells like [Tcsh/Csh](https://en.wikipedia.org/wiki/Tcsh), [Ksh](https://en.wikipedia.org/wiki/KornShell), [Zsh](https://en.wikipedia.org/wiki/Z_shell), [Fish](https://en.wikipedia.org/wiki/Friendly_interactive_shell) shell and others.
