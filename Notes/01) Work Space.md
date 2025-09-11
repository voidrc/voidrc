# Operating Systems
when it comes to **cyber security**, you’ve heard of _linux_. if not, go do your own recon.  
let’s cut the noise: there’s **no perfect linux distro** for everyone.  
your #1 could be someone else’s nightmare (Like i hate windows).

main Rule: **use what feels good to you.**  
youtube nerds may chant _“kali is the holy grail”_, insta princesses might claim _“i hack on windows”_. truth is: **any OS can be weaponized** (hell, maybe even your 90s tv 👀).

---
## ready-to-use hacking distros
not in the mood to craft your machine from scratch? here’s the **fast-food menu** of hacker OS:

- **kali linux** → big brand, big toolbox. heavy, but famous.
- **parrot os** → kali’s leaner, privacy-friendly cousin.
- **blackarch** → arch-based repo with 2k+ tools. brutal for beginners.
- **tails** → live-boot ghost OS. tor everywhere, leaves no trace.
- **whonix** → anonymity bunker inside VMs. rock solid, resource hungry.

---
## arch (bare-metal, no mercy)
My recommendation is **arch linux** (or any distro birthed from it). here’s why:

- **minimal** → needs ~2–3 GB RAM, while windows gulps 8 GB just to exist.
- **no bloatware** → you start with nothing, build exactly what you want. you _know every process_ running in the background.
- **community-managed** → no corp leash. arch is user-driven, meaning strong privacy culture. no company siphoning your data.

> arch = minimal muscle, no spyware diet, full root-level freedom.

i love **gaming** + **aesthetics**, so my stack is:  
**cachyos** + **hyprland (HyDE dots)** + **blackarch repo**

install flow:
1. install **cachyos** (barebones, no WM/DE).
2. clone **HyDE project** from [github](https://github.com/HyDE-Project/HyDE) - and follow the setup for a polished hyprland workspace.
- reboot → inject **blackarch repo**:
```bash
curl -O https://blackarch.org/strap.sh
echo bbf0a0b838aed0ec05fff2d375dd17591cbdf8aa strap.sh | sha1sum -c
chmod +x strap.sh
sudo ./strap.sh
sudo pacman -Syu
```

BOOM. now you’ve got a **high-performance, slick-looking, arsenal-loaded machine** — ready to bend the digital world to your will.

---
## bonus
OS forged, beast is alive. now it needs gear. here’s what i strap on — take it, tweak it, or choke on it — your choice.
- **Firefox** → visor, stripped & hardened.
- **Proton stack** (mail, pass, drive, vpn, whatever) → privacy armor.
- **PWNdoc** → clean reports when you gotta look “professional.”
- **Ghostwriter** → markdown hitman, no distractions.
- **Obsidian** → brain-vault, notes + logs synced.
- **Peek** → record your moves, prove the kill (didn't work smoothly with my set-up.
- **RedLogs (soon)** → my own logging beast in the making.
