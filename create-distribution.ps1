# She++ Distribution Package Creator (PowerShell)
# Packages She++ for distribution to users

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  She++ Distribution Package Creator" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Build the project
Write-Host "Building She++ compiler..." -ForegroundColor Cyan
& .\build.bat
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Build failed." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Remove old distribution folder
if (Test-Path "dist") {
    Write-Host "Cleaning up old distribution folder..." -ForegroundColor Yellow
    Remove-Item -Path "dist" -Recurse -Force
}

# Create distribution folder structure
Write-Host "Creating distribution package..." -ForegroundColor Cyan
New-Item -ItemType Directory -Path "dist" | Out-Null
New-Item -ItemType Directory -Path "dist\examples" | Out-Null

# Copy executables and scripts
Copy-Item "she.exe" "dist\she.exe"
Copy-Item "install.bat" "dist\install.bat"
Copy-Item "uninstall.bat" "dist\uninstall.bat"
Copy-Item "install-ps.ps1" "dist\install-ps.ps1"
Copy-Item "uninstall-ps.ps1" "dist\uninstall-ps.ps1"

# Copy documentation
Copy-Item "GETTING_STARTED.md" "dist\GETTING_STARTED.md"
Copy-Item "README.md" "dist\README.md"

# Copy examples
Get-ChildItem "examples\*.she" | ForEach-Object {
    Copy-Item $_ "dist\examples\$($_.Name)"
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Package Created Successfully!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Location: .\dist\" -ForegroundColor White
Write-Host ""
Write-Host "Contents:" -ForegroundColor Cyan
Write-Host "  - she.exe (Compiled interpreter)" -ForegroundColor White
Write-Host "  - install.bat (Windows installer)" -ForegroundColor White
Write-Host "  - install-ps.ps1 (PowerShell installer)" -ForegroundColor White
Write-Host "  - uninstall.bat (Windows uninstaller)" -ForegroundColor White
Write-Host "  - uninstall-ps.ps1 (PowerShell uninstaller)" -ForegroundColor White
Write-Host "  - GETTING_STARTED.md (User guide)" -ForegroundColor White
Write-Host "  - README.md (Project overview)" -ForegroundColor White
Write-Host "  - examples\ (Example She++ programs)" -ForegroundColor White
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Yellow
Write-Host "  1. Zip the dist folder: 'She++-v1.0.zip'" -ForegroundColor White
Write-Host "  2. Share with users" -ForegroundColor White
Write-Host "  3. Users extract and run install.bat" -ForegroundColor White
Write-Host ""
Read-Host "Press Enter to exit"
