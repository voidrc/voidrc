### **Encrypt Like a Shadow**
#### **1. Install GPG**
```bash
sudo pacman -S gnupg
```

#### **2. Generate Your Keypair (Public + Private)**
```bash
gpg --full-generate-key
```
- **Follow prompts**:
  - Key type: `RSA and RSA` (default).
  - Key size: `4096` (stronger).
  - Expiration: `0` (never expires).
  - Name/Email: Use your alias.
  - Passphrase: **Memorize this** (like a ritual chant).

#### **3. Encrypt Your Journal**
```bash
gpg --encrypt --recipient "user" test.txt
```
- Output: `test.txt.gpg` (unreadable without your key).

#### **4. Decrypt When Needed**
```bash
gpg --decrypt test.txt.gpg > test.txt
```
- Enter your passphrase to unlock.

---

### **Key Management**
- **List Keys**:  
  ```bash
  gpg --list-keys          # Public keys
  gpg --list-secret-keys   # Private keys
  ```
- **Export Public Key** (share with allies):  
  ```bash
  gpg --export --armor "user" > user_public.asc
  ```
- **Backup Keys** (to a USB, guarded like a relic):  
  ```bash
  gpg --export-secret-keys --armor "user" > user_private.asc
  ```

---

### **Why This Matters**
- **Secrets Stay Secret**: Even if your files are stolen, they’re gibberish without your key.
- **Signatures**: Prove a file is truly from you (use `--sign`).
- **Ethical Power**: Protect your secrets from prying eyes.

---

### **Pro Tips for the Newborn Shadow**
- **Passphrase**: Make it strong but memorable. Example:  
  `"Nyx_Knows_My_SSH_Config_1337!"` 🔑  
- **Backup Keys**: Store them offline (USB + paper).  
- **Practice**: Encrypt/decrypt dummy files until it’s muscle memory.
  
