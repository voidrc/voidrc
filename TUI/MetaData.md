# Quick summary

* Single best Swiss-army CLI: **ExifTool** (images, PDF, Office, many audio/video container tags).
* Media container-level editor: **ffmpeg** (MP4/MKV/MP3/AAC tags) + **AtomicParsley** (mp4).
* Audio-tag focused: **kid3**, **easytag**, **puddletag**, **musicbrainz-picard**, **mutagen** (Python lib).
* Text/script metadata: use **extended attributes** (`setfattr`/`getfattr`), standardized **frontmatter** (YAML) for Markdown, and **git** metadata for provenance.
* PDF-specific: **exiftool**, **pdfinfo**/**pdftk**/**qpdf** for container and structural info; GUI: **Okular**/**qpdfview**/**pdfarranger**.
* TUI stack suggestion: **Textual** (modern, rich) or **urwid/prompt_toolkit**; use subprocess wrappers to call exiftool/ffmpeg/mutagen.

---

# Install suggestions (Debian/Ubuntu style)

```bash
sudo apt update
sudo apt install -y exiftool ffmpeg mutagen easytag kid3-qt python3-pip libarchive-tools
# Optional
sudo apt install -y pdftk qpdf poppler-utils  # pdfinfo is in poppler-utils
pip3 install mutagen textual rich prompt_toolkit
# AtomicParsley may need building or distro package:
sudo apt install -y atomicparsley  # if available
```

---

# Concrete commands & examples

## 1) Audio (ID3, FLAC, Vorbis)

### Inspect:

```bash
# MP3/FLAC/OGG etc - exiftool inspects many audio tags
exiftool song.mp3
```

### Edit using exiftool:

```bash
exiftool -overwrite_original \
  -Artist="Artist Name" -Album="Album" -Title="Track Title" \
  song.mp3
```

### FLAC / vorbiscomment:

```bash
vorbiscomment -l file.flac   # list
vorbiscomment -a -t "ARTIST=Artist" file.flac
```

### Python (mutagen) — direct library edits:

```python
from mutagen.easyid3 import EasyID3
f = EasyID3("song.mp3")
f["artist"] = "Artist Name"
f["title"]  = "New Title"
f.save()
```

## 2) Video / container-level tags (mp4, mkv)

### Inspect:

```bash
ffmpeg -i video.mp4  # prints container metadata summary
exiftool video.mp4
```

### Set tags (without re-encoding):

```bash
ffmpeg -i input.mp4 -c copy -metadata title="New Title" -metadata comment="Made with Void-Strike" output.mp4
```

### MP4-specific (AtomicParsley):

```bash
AtomicParsley input.mp4 --title "Title" --artist "Artist" -o output.mp4
```

## 3) PDFs

### Inspect:

```bash
pdfinfo file.pdf
exiftool file.pdf
```

### Edit common PDF metadata with exiftool:

```bash
exiftool -overwrite_original -Title="Doc Title" -Author="Your Name" file.pdf
```

### Rewriting streams / repair:

* `qpdf` and `pdftk` can do some manipulations; exiftool writes metadata fields.

## 4) Scripts (Python, Bash, C/C++), Markdown, plain text

Scripts and plaintext don’t have embedded standardized metadata except comments and filesystem xattrs. Two robust options:

* **YAML frontmatter** (for Markdown — and you can adopt same concept for scripts in header comments).
* **Extended attributes** (xattr) — preserved by many tools and portable on Linux.

### Add xattr:

```bash
# View existing attributes
getfattr -d file.py

# Set attribute
setfattr -n user.author -v "Void-Strike" script.py

# Read it back
getfattr -n user.author script.py
```

### Use comment headers for scripts (human + tool readable)

Add a standard header to scripts:

```python
# ---
# title: "Helper utility"
# author: "Void-Strike"
# version: "0.1"
# license: "MIT"
# tags: [tooling, metadata]
# ---
```

Your TUI can parse that frontmatter for editing.

### Git metadata for provenance

Encourage storing authoritative metadata in git commits (author, timestamp, tags). Use `git` as a metadata backend.

## 5) Backup / dry-run / batch patterns (very important)

Always backup before destructive ops:

```bash
# exiftool default creates _original files; if you want in-place:
exiftool -overwrite_original -Artist="Foo" *.jpg
# Or batch with backups:
exiftool -r -ext mp3 -Artist="Art" -o . /path/to/dir  # careful; test first
```

---

# GUI tools you might like

* **Kid3** — powerful cross-platform tag editor (audio).
* **EasyTAG** — GTK audio tag editor.
* **Puddletag** — Qt, spreadsheet-like tag editing.
* **MusicBrainz Picard** — automatic metadata lookup for audio.
* **Okular**, **qpdfview**, **pdfarranger** — for PDF viewing & light metadata tasks.
* **Nemo/Nautilus** with scripts — you can add right-click actions that call your CLI.

---

# TUI project — practical plan and architecture

You said you’ll create a TUI for every utility/command you use. Love that. Here’s a pragmatic architecture and the smallest viable prototype plan.

## Goals

* Single TUI wrapper that: detects file type, shows current metadata, allows editing fields, batch operations, preview, dry-run, create backups, and keeps an undo log.
* Plugin system per file-type: each plugin maps fields to specific tool(s) (exiftool, ffmpeg, mutagen, setfattr, etc.).
* Transactional batch: create backups before writing, record changes in a local metadata DB (sqlite).

## Recommended stack

* UI: **Textual** (Textualize) — modern, supports layouts, tables, editable forms, async subprocess calls. Alternative: **urwid** or **prompt_toolkit**.
* Subprocess / wrapper: Python’s `subprocess` + small adapter classes per tool.
* Libraries: **mutagen** for audio, **python-xattr** for xattrs, call **exiftool**/**ffmpeg** via subprocess for everything else.
* Database: **sqlite** for storing change history (who/when/what).
* Packaging: Make the app scriptable so you can call `mdtool edit path --field Artist="..."` for automation.

## Plugin interface (pseudo)

Each plugin implements:

* `detect(path) -> bool`
* `read(path) -> dict` (canonical field names)
* `write(path, dict_of_fields, dry_run=False) -> result`
* `gui_schema() -> fields to present`

Example plugin mapping:

* Audio plugin: uses mutagen for MP3/FLAC, fallback to exiftool
* Video plugin: uses ffprobe/ffmpeg/exiftool
* Script plugin: uses xattr + frontmatter parsing

## UX features to prioritize

* **Preview** before applying.
* **Batch preview** showing diffs.
* **Dry-run** flag.
* **Auto-backup** (store original in `.meta-backups/` or create `.orig` files).
* **Undo** via sqlite log + backup restore command.
* **Search and templating** (apply patterns: set Artist from filename, or from YAML template).
* **Integration hooks** for MusicBrainz or other lookup APIs (optional).

---

# Minimal example: Textual skeleton that calls exiftool (starter)

Below is the conceptual skeleton — if you want I can provide a runnable Textual app next. (I'll keep it compact here.)

```python
# pseudo-skeleton
from textual.app import App
from textual.widgets import Header, Footer, DataTable, Button
import subprocess, json

def exif_read(path):
    # exiftool can output JSON
    out = subprocess.check_output(["exiftool", "-j", path])
    return json.loads(out)[0]

def exif_write(path, tags):
    # tags is dict
    cmd = ["exiftool", "-overwrite_original"]
    for k,v in tags.items():
        cmd.append(f"-{k}={v}")
    cmd.append(path)
    subprocess.check_call(cmd)

class MetaTUI(App):
    async def on_mount(self):
        self.header = Header()
        self.footer = Footer()
        self.table = DataTable()
        await self.view.dock(self.header,edge="top")
        await self.view.dock(self.footer,edge="bottom")
        await self.view.dock(self.table,edge="left")

    async def load_file(self, path):
        meta = exif_read(path)
        # show in table, editable form etc.
```

---

# Small utilities & tips you’ll want to include in TUI

* `file` & `mimetype` detection.
* `ffprobe` for detailed media streams.
* automatic mapping: e.g., `Title` <-> MP4 `title` vs. ID3 `TIT2`.
* templates for common tag sets (podcast/album/film/lecture).
* integration with `ripgrep`/`fd` to find files quickly.

---

# Caveats, ethics & filesystem notes

* Editing metadata can break digital signatures, notarized docs, or certified PDFs. Don’t edit signed files you don’t own.
* Extended attributes may not survive copying to some filesystems (FAT32, some cloud storage tools).
* Some forensic traces (MFT records, inode change times) are not removed by simple metadata edits.
* Always keep backups and record an undo log.

---

# Next practical steps
1. Install `exiftool`, `ffmpeg`, `mutagen`, `textual`.
2. Prototype a tiny plugin that: detects MP3, reads tags, edits a single field, and writes a backup.
3. Expand to support ffmpeg-based container tags and xattr/frontmatter for scripts.
4. Add batch/dry-run and undo.