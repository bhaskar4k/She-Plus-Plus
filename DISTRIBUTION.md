# She++ - Language Installation & Distribution Guide

## Project Structure

```
She++/
├── Lexer.h / Lexer.cpp        (Implementation - Hidden from users)
├── Parser.h / Parser.cpp      (Implementation - Hidden from users)
├── Interpreter.h / Interpreter.cpp (Implementation - Hidden from users)
├── AST.h                      (Implementation - Hidden from users)
├── main.cpp                   (Implementation - Hidden from users)
│
├── build.bat                  (Build script)
├── install.bat                (Installation script for users)
├── uninstall.bat              (Uninstall script)
│
├── install-ps.ps1             (PowerShell installer alternative)
├── uninstall-ps.ps1           (PowerShell uninstaller alternative)
│
├── GETTING_STARTED.md         (User guide)
├── DISTRIBUTION.md            (This file)
├── README.md                  (Project overview)
│
├── examples/                  (User example files)
│   ├── 01_hello.she
│   ├── 02_arithmetic.she
│   ├── 03_calculations.she
│   └── 04_circle_area.she
│
└── dist/                      (Distribution package - optional)
    ├── she.exe                (Compiled executable only)
    ├── install.bat            (Standalone installer)
    ├── uninstall.bat          (Standalone uninstaller)
    └── examples/              (Example files)
```

## For End Users

### Installation Steps

1. **Windows Command Prompt**
   - Right-click `install.bat` → Choose "Run as administrator"
   - Follow the prompts
   - Close and reopen Command Prompt
   - Test: `she examples\01_hello.she`

2. **Windows PowerShell**
   - Right-click PowerShell → Choose "Run as administrator"
   - Run: `Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process`
   - Run: `.\install-ps.ps1`
   - Test: `she examples\01_hello.she`

### Using She++

After installation, users can create `.she` files anywhere:

```batch
REM Create a file: myprogram.she
she myprogram.she
```

## For Developers (You)

### Building from Source

```bash
build.bat
```

This creates `she.exe` with optimizations enabled.

### Creating a Distribution Package

1. **Generate Release Build**
   ```bash
   build.bat
   ```

2. **Create Distribution Folder**
   ```bash
   mkdir dist
   copy she.exe dist\
   copy install.bat dist\
   copy uninstall.bat dist\
   copy install-ps.ps1 dist\
   copy uninstall-ps.ps1 dist\
   xcopy examples dist\examples\ /E
   copy GETTING_STARTED.md dist\
   ```

3. **Distribute**
   - Zip the `dist` folder
   - Share with users
   - Users extract and run `install.bat`

### Key Features of This Setup

✅ **Hidden Implementation** - Users only see `she.exe`, not source code
✅ **System Integration** - Installs to Program Files, adds to PATH
✅ **Easy Uninstall** - Complete cleanup with uninstall script
✅ **Works Anywhere** - Users can use `she` from any directory
✅ **Example Files** - Users have reference programs to learn from
✅ **Platform Support** - Both .bat and PowerShell installers

## Advanced: Creating a Portable Version

To create a version that doesn't require installation:

1. Users can place `she.exe` in any folder
2. Run commands from that folder: `.\she yourfile.she`
3. Or add the folder to PATH manually

## Advanced: Creating a Proper Installer

For a more professional installer, consider:
- **NSIS** (Nullsoft Scriptable Install System)
- **WiX** (Windows Installer XML)
- **Inno Setup**

These create `.exe` installers with GUI and automatic cleanup.

## System Information

**Installation Directory**: `C:\Program Files\She++`
**Executable**: `C:\Program Files\She++\she.exe`
**File Extension**: `.she`
**Supported OS**: Windows (XP and later)
**Requirements**: None (executable is self-contained)

## Troubleshooting for Users

### "she is not recognized"
- Reboot or close/reopen Command Prompt
- Verify `C:\Program Files\She++` exists
- Check PATH contains `C:\Program Files\She++`

### "Cannot open file"
- Use full path: `she C:\Users\Name\Documents\file.she`
- Check file exists and has `.she` extension

### "Error: Only .she files are supported"
- Ensure filename ends with `.she` extension

## Version Updates

To update She++ for users:

1. Rebuild: `build.bat`
2. Generate new distribution package (see step above)
3. Users uninstall old version: `uninstall.bat`
4. Users install new version: `install.bat`

---

**She++ is now ready for distribution!** 🎉
