## 🔍 Compare Branches

### 🔹 Code Differences

```bash
git diff develop..main           # Changes in main not in develop
git diff main..develop           # Changes in develop not in main
```

### 🔹 File List Only

```bash
git diff --name-only develop..main
```

### 🔹 Commit Differences

```bash
git log develop..main            # Commits in main but not in develop
git log main..develop            # Commits in develop but not in main
git log develop..main --oneline  # Short version
```

---

## 🔁 Get Changes from `main` into `develop` (without merging)

### 🔹 Cherry-pick commits

```bash
git checkout develop
git cherry-pick <commit-hash>    # Pick specific commits from main
```

### 🔹 Rebase develop onto main

```bash
git checkout develop
git rebase main
```

> Rewrites history: places your `develop` commits on top of `main`.

### 🔹 Checkout specific files from main

```bash
git checkout main -- path/to/file
git commit -m "Take file from main"
```

### 🔹 Use a patch

```bash
git format-patch -1 <commit> --stdout > patch.diff
git checkout develop
git apply patch.diff
```

---

## ⏪ Revert to Last Push (Reset Local Branch to Remote)

### 🔹 Hard reset to remote state

```bash
git fetch origin
git reset --hard origin/develop
```

> Discards local commits & uncommitted changes

### 🔹 Keep file changes, remove local commits

```bash
git reset --soft origin/develop
```

### 🔹 Also delete untracked files

```bash
git clean -fd
```

---

## 🗑️ Delete Branches

### 🔹 Delete Local Branch

```bash
git branch -d branch-name        # Safe delete (if merged)
git branch -D branch-name        # Force delete
```

### 🔹 Delete Remote Branch

```bash
git push origin --delete branch-name
```

### 🔹 Clean up local stale remote refs

```bash
git fetch --prune
```

