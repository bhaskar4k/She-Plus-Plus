# She++ - A Language That Really Understands You

<p align="center">
  <i>Might Be Your Favorite She++</i><br>
  <i>A Language That Really Understands You (And Me Too) ☹️</i>
</p>

---

## 👤 For Users

**Just installed She++?** Start here: [GETTING_STARTED.md](GETTING_STARTED.md)

### Quick Start

```bash
# Create a She++ file
she yourfile.she

# Or without extension
she yourfile
```

### Installation

1. **Windows Command Prompt**
   - Right-click `install.bat` → "Run as administrator"
   - Close and reopen Command Prompt
   - Test: `she examples\01_hello.she`

2. **Windows PowerShell**
   - Right-click PowerShell → "Run as administrator"
   - Run: `Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process`
   - Run: `.\install-ps.ps1`

### Example Programs

Check the `examples/` folder for sample She++ programs:
- `01_hello.she` - Hello World
- `02_arithmetic.she` - Basic Math
- `03_calculations.she` - Multiple Calculations
- `04_circle_area.she` - Area Calculation

---

## 👨‍💻 For Developers

### Building

```bash
build.bat
```

Creates `she.exe` with optimizations.

### Creating a Distribution Package

```bash
create-distribution.bat
```

or (PowerShell):

```powershell
.\create-distribution.ps1
```

This packages everything needed for users:
- Compiled executable
- Installation scripts
- Documentation
- Example files

### Project Structure

```
├── Lexer.h/cpp              # Tokenization
├── Parser.h/cpp             # Syntax Analysis
├── Interpreter.h/cpp        # Execution
├── AST.h                    # Abstract Syntax Tree
├── main.cpp                 # Entry Point
│
├── build.bat                # Compilation
├── install.bat              # User Installer
├── create-distribution.bat  # Package Creator
│
├── examples/                # Sample Programs
└── GETTING_STARTED.md       # User Guide
```

### File Format

She++ programs use the `.she` extension:

```she
ExecutionInitializer [
    number x = 10
    number y = 20
    number z = x + y
    
    display[z]
]
```

---

## 🎯 Features

- ✅ **Variables**: `number x = 42`
- ✅ **Arithmetic**: `+`, `-`, `*`, `/`
- ✅ **Output**: `display[value]`
- ✅ **Clean Syntax**: Readable and intuitive

---

## 📦 Distribution

For complete distribution instructions, see [DISTRIBUTION.md](DISTRIBUTION.md)

**Quick Packaging:**
1. Run `create-distribution.bat`
2. Zip the `dist/` folder
3. Share with users
4. Users run `install.bat`

---

## 📚 Documentation

- [User Guide](GETTING_STARTED.md) - How to use She++
- [Distribution Guide](DISTRIBUTION.md) - Package for others
- [Examples](examples/) - Sample programs

---

## 🚀 Installation (Users)

See [GETTING_STARTED.md](GETTING_STARTED.md) 