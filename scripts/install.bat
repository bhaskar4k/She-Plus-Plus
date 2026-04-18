@echo off
setlocal enabledelayedexpansion

echo.
echo ====================================================
echo     She++ Language Installer
echo ====================================================
echo.

REM Check if running as administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Error: This installer must be run as Administrator.
    echo Please right-click this file and select "Run as administrator".
    pause
    exit /b 1
)

echo [1/3] Checking installation directory...
set "INSTALL_DIR=C:\Program Files\She++"
set "SCRIPT_DIR=%~dp0"

if not exist "%INSTALL_DIR%" (
    mkdir "%INSTALL_DIR%"
    echo [OK] Created: %INSTALL_DIR%
) else (
    echo [OK] Directory exists: %INSTALL_DIR%
)

echo.
echo [2/3] Building She++ compiler...
cd /d "%SCRIPT_DIR%"
if %errorLevel% neq 0 (
    echo [ERROR] Failed to access installation files
    pause
    exit /b 1
)

call build.bat
if %errorLevel% neq 0 (
    echo [ERROR] Build failed. Check if C++ compiler is installed.
    pause
    exit /b 1
)
echo [OK] Build successful

echo.
echo [3/3] Copying executable...
if not exist "%SCRIPT_DIR%..\bin\she.exe" (
    echo [ERROR] she.exe not found at %SCRIPT_DIR%..\bin\she.exe
    pause
    exit /b 1
)

copy /Y "%SCRIPT_DIR%..\bin\she.exe" "%INSTALL_DIR%\she.exe"
if %errorLevel% neq 0 (
    echo [ERROR] Failed to copy she.exe
    pause
    exit /b 1
)
echo [OK] Copied to %INSTALL_DIR%\she.exe

echo.
echo ====================================================
echo     Installation Complete!
echo ====================================================
echo.
echo She++ installed at: %INSTALL_DIR%\she.exe
echo.
echo NEXT STEP: Add to PATH (You've to do this manually)
echo ====================================================
echo.
echo To use 'she' command from anywhere, add to PATH:
echo.
echo 1. Press Windows Key
echo 2. Type: environment variables
echo 3. Click: "Edit the system environment variables"
echo 4. Click: "Environment Variables..." button
echo 5. Under "System variables", click "Path"
echo 6. Click: "New"
echo 7. Paste: %INSTALL_DIR%
echo 8. Click: OK on all windows
echo 9. Close and reopen Command Prompt
echo.
echo Then you can use:
echo    she yourfile.she
echo.
pause