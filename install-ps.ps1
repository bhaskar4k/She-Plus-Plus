# She++ Language Installer for Windows (PowerShell)
# Run this script as Administrator: Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

# Requires administrator
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Error: This script must be run as Administrator." -ForegroundColor Red
    Write-Host "Please right-click PowerShell and select 'Run as administrator'." -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "     She++ Language Installer" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$INSTALL_DIR = "C:\Program Files\She++"

# Create installation directory
if (-not (Test-Path $INSTALL_DIR)) {
    New-Item -ItemType Directory -Path $INSTALL_DIR -Force | Out-Null
    Write-Host "Created installation directory: $INSTALL_DIR" -ForegroundColor Green
} else {
    Write-Host "Installation directory already exists: $INSTALL_DIR" -ForegroundColor Yellow
}

# Build the project
Write-Host ""
Write-Host "Building She++ compiler..." -ForegroundColor Cyan
& .\build.bat
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Build failed. Please check your C++ compiler setup." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Copy executable
if (Test-Path "she.exe") {
    Copy-Item "she.exe" "$INSTALL_DIR\she.exe" -Force
    Write-Host "Copied She++ executable to $INSTALL_DIR" -ForegroundColor Green
} else {
    Write-Host "Error: she.exe not found. Build may have failed." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Add to PATH
Write-Host ""
Write-Host "Adding She++ to system PATH..." -ForegroundColor Cyan

$CurrentPath = [Environment]::GetEnvironmentVariable("Path", "Machine")
if ($CurrentPath -notlike "*$INSTALL_DIR*") {
    [Environment]::SetEnvironmentVariable("Path", "$CurrentPath;$INSTALL_DIR", "Machine")
    Write-Host "Added She++ to PATH successfully." -ForegroundColor Green
} else {
    Write-Host "She++ is already in PATH." -ForegroundColor Yellow
}

# Create example file
Write-Host ""
Write-Host "Creating example She++ file..." -ForegroundColor Cyan
if (-not (Test-Path "examples")) {
    New-Item -ItemType Directory -Path "examples" -Force | Out-Null
}

if (-not (Test-Path "examples\hello.she")) {
    @"
ExecutionInitializer [
    display["Hello from She++"]
]
"@ | Out-File -FilePath "examples\hello.she" -Encoding UTF8
    Write-Host "Created: examples\hello.she" -ForegroundColor Green
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "     Installation Complete!" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "To start using She++, open a new PowerShell/CMD and run:" -ForegroundColor Green
Write-Host "    she yourfile.she" -ForegroundColor White
Write-Host ""
Write-Host "Example:" -ForegroundColor Green
Write-Host "    she examples\hello.she" -ForegroundColor White
Write-Host ""
Read-Host "Press Enter to exit"
