## philosophy

linux ain’t about bloated “all-in-one” trash — it’s lego blocks for nerds with patience and caffeine. tiny tools, each doing one thing right, duct-taped together into monsters. here’s the creed:

- **everything is a file** → configs, devices, your soul. all text. all editable.
- **tiny sharp programs** → each does one job, no fat. like scalpels, not swiss knives.
- **chain ‘em up** → grep → awk → sed → pipe hell → result. build ops like legos on fire.
- **no shiny prison uis** → keyboard rules, terminal is king. clickers are npcs.
- **text config reigns** → `/etc/passwd` doesn’t lie. text is forever.

---

## components (the moving guts)

- **bootloader** → the doorman. lets the kernel in.
- **kernel** → the big boss, owns your cpu/ram/ios. obey.
- **daemons** → ghosts working in bg. printing, scheduling, etc. (not holy, just annoying).
- **shell** → your mouthpiece to the kernel. bash, zsh, fish — choose your accent.
- **x/wayland server** → graphics crack. makes pixels happen.
- **window manager** → eye candy vs minimalism wars (gnome/kde/hypr etc).
- **utilities** → all the toys and gadgets, from `ls` to `nmap`.

---

## architecture (layered cake of pain)

- **hardware** → raw metal (ram, cpu, disks).
- **kernel** → translates metal into something not awful.
- **shell** → where you scream at the kernel.
- **system utilities** → comfy gloves for smashing everything else.

---

## filesystem hierarchy (the haunted mansion)

root `/` is the entry hall. each door leads somewhere cursed:

- `/bin` → basic weapons.
- `/boot` → kernel + boot rituals.
- `/dev` → fake files that are actually devices.
- `/etc` → configs aka the spellbooks.
- `/home` → your stuff. guard it.
- `/lib` → support libraries.
- `/media` → usb corpses mount here.
- `/mnt` → temp mount spot.
- `/opt` → random third-party junk.
- `/root` → boss man’s home.
- `/sbin` → system admin commands, dangerous toys.
- `/tmp` → garbage bin. nuked on reboot.
- `/usr` → “userland” stuff, tools, docs.
- `/var` → logs, mail, caches. aka the evidence pile.    

---

## distributions (flavors of the cult)

all distros = linux under the hood. the differences? packages, philosophy, community, drama.

- **arch** → barebones, control freaks only.
- **blackarch** → arch + 1,000s of hacking toys duct-taped on.
- **kali** → overrated, youtuber bait. still usable.
- **parrot** → kali but with less cringe.
- **ubuntu** → normie linux, works out of the box.
- **debian** → stable like a fossil. servers love it.
- **fedora** → bleeding edge, corporate vibes.
- **centos/rhel** → enterprise cult.
- **raspberry pi os** → tinker toy distro.    
- **pentoo/backbox/athena** → hacker-niche distros.

rule: **any distro can hack**. even your smart fridge. don’t let influencers gaslight you.

---

## cli (where magic happens)

the terminal is the cathedral. the shell is your spellbook. typing commands feels rough at first, but once you see the power, GUIs look like plastic toys.

- gui = babysitter.
- cli = shotgun with unlimited shells.

once you switch, you never go back.

---

## terminal emulators (fake terminals in your pretty gui)

real terminals = old metal boxes. modern terminals = emulators running in your desktop. they’re your **window** to the shell.  
wanna multitask? use **tmux** → split panes, multiple sessions, feels like controlling drones.

---

## shells (pick your poison)

- **bash** → the default, the dinosaur, reliable.
- **zsh** → flashy, themes, plugins, the cool kid.
- **fish** → autocomplete heaven, kinda bloated and i like it.
- **ksh/tcsh** → oldschool survivors, if you’re hardcore.