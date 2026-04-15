# She++ Setup Guide

---

## File Structure

| File | Purpose |
|------|---------|
| `build.bat` | Compile the project |
| `install.bat` | Install She++ to `C:\Program Files\She++` |
| `uninstall.bat` | Remove installation folder |
| `create-distribution.bat` | Package for distribution |

---

## Distribution Package

Run `create-distribution.bat` creates:
```
dist/
├── she.exe              (Compiled interpreter)
├── install.bat          (Installation script)
├── uninstall.bat        (Removes installation)
├── README.md            (Project info)
└── GETTING_STARTED.md   (User guide)
```

**To distribute**: Zip the `dist/` folder and share as `She++-v1.0.zip`

---

## Installation

**What install.bat does:**
- Creates `C:\Program Files\She++`
- Copies `she.exe` there
- Now User will to system PATH at envionment variable - `C:\Program Files\She++`
- Requires Administrator privileges

**User can then run:**
```bash
she myprogram.she       # From anywhere
she hello.she / she hello  # Works with paths
```

---

## Uninstallation

**What uninstall.bat does:**
- Removes `C:\Program Files\She++` folder
- Does NOT modify system PATH (safe)
- Requires Administrator privileges

---

## Development Workflow

1. Edit source: `Lexer.cpp`, `Parser.cpp`, `Interpreter.cpp`
2. Run `build.bat`
3. Test: `she test.she`
4. Update distribution: `create-distribution.bat`
5. Distribute updated zip file

---

## Troubleshooting

| Issue | Fix |
|-------|-----|
| `build.bat` fails | Ensure C++ compiler installed (MinGW/MSVC) |
| `install.bat` fails | Run as Administrator |
| "she" command not found | Close and reopen Command Prompt after install |
| Installation folder missing | Check `C:\Program Files\She++` exists |

---

## Distribution Methods

| Method | Steps |
|--------|-------|
| **GitHub** | Run `create-distribution.bat` → Zip `dist/` → Upload to Releases |
| **Network Share** | Copy `dist/` to shared drive → Users run `install.bat` |
| **Direct Share** | Zip `dist/` → Send via email/cloud → Users extract & install |

---

## Summary

- **Developers**: `build.bat` → test → `create-distribution.bat`
- **Users**: Extract zip → Run `install.bat` → Use `she` command
- **Uninstall**: Run `uninstall.bat` (safe, removes folder only)
