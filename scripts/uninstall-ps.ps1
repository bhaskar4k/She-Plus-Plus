# She++ Language Uninstaller for Windows (PowerShell)
# Run this script as Administrator

# Requires administrator
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Error: This script must be run as Administrator." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "Uninstalling She++ Language..." -ForegroundColor Cyan
Write-Host ""

$INSTALL_DIR = "C:\Program Files\She++"

# Remove from PATH
Write-Host "Removing She++ from PATH..." -ForegroundColor Cyan
$CurrentPath = [Environment]::GetEnvironmentVariable("Path", "Machine")
$NewPath = $CurrentPath -replace [regex]::Escape("$INSTALL_DIR;"), ''
$NewPath = $NewPath -replace [regex]::Escape(";$INSTALL_DIR"), ''
$NewPath = $NewPath -replace [regex]::Escape($INSTALL_DIR), ''

if ($NewPath -ne $CurrentPath) {
    [Environment]::SetEnvironmentVariable("Path", $NewPath, "Machine")
    Write-Host "Removed She++ from PATH." -ForegroundColor Green
}

# Remove installation directory
if (Test-Path $INSTALL_DIR) {
    Remove-Item -Path $INSTALL_DIR -Recurse -Force
    Write-Host "Removed installation directory: $INSTALL_DIR" -ForegroundColor Green
}

Write-Host ""
Write-Host "Uninstall complete!" -ForegroundColor Green
Write-Host "She++ has been removed from your system." -ForegroundColor Green
Write-Host ""
Read-Host "Press Enter to exit"
