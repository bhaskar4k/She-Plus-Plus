# She++ Language - User Guide

Welcome to She++! A language that really understands you.

## Installation

### Windows
1. Right-click `install.bat` and select **Run as administrator**
2. The installer will:
   - Build the She++ compiler
   - Install it to `C:\Program Files\She++`
   - Add it to your system PATH

3. Close and reopen your Command Prompt or PowerShell
4. Test the installation: Create a `.she` file and run it

### Uninstalling
Right-click `uninstall.bat` and select **Run as administrator**

## Usage

Once installed, you can compile She++ files from anywhere:

```bash
she yourfile.she
```

Or without the extension:
```bash
she yourfile
```

## Examples

### Hello World
Create a file named `hello.she`:

```
ExecutionInitializer [
    display["Hello from She++"^]
]
```

Then run:
```bash
she hello.she
```

### Variables and Calculations
Create `math.she`:

```
ExecutionInitializer [
    number x = 10
    number y = 20
    number z = x + y
    
    display[z]
]
```

Run:
```bash
she math.she
```

## Language Features

- **Numbers**: `number x = 42`
- **Display Output**: `display[value]`
- **Basic Arithmetic**: `+`, `-`, `*`, `/`
- **Initialization Block**: `ExecutionInitializer []`

## Troubleshooting

### Command not found: 'she'
- Ensure you ran `install.bat` as Administrator
- Close and reopen your Command Prompt
- Verify She++ is installed at `C:\Program Files\She++`

### File not found
- Ensure the `.she` file exists in your current directory
- Use the full path to the file: `she C:\path\to\file.she`

### Build failed
- Ensure you have a C++ compiler installed (MinGW or MSVC)
- Check that `build.bat` runs successfully

## Support

For issues or questions, refer to the project repository.

---

**Happy coding with She++!** ☹️
