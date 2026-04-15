@echo off
REM She++ Language Installer for Windows
REM This script installs She++ to your system and adds it to PATH

setlocal enabledelayedexpansion

echo.
echo ========================================
echo     She++ Language Installer
echo ========================================
echo.

REM Check if running as administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Error: This installer must be run as Administrator.
    echo Please right-click this file and select "Run as administrator".
    pause
    exit /b 1
)

REM Define installation directory
set "INSTALL_DIR=C:\Program Files\She++"

REM Create installation directory
if not exist "%INSTALL_DIR%" (
    mkdir "%INSTALL_DIR%"
    echo Created installation directory: %INSTALL_DIR%
) else (
    echo Installation directory already exists: %INSTALL_DIR%
)

REM Build the project
echo.
echo Building She++ compiler...
call build.bat
if %errorLevel% neq 0 (
    echo Error: Build failed. Please check your C++ compiler setup.
    pause
    exit /b 1
)

REM Copy executable
if exist "she.exe" (
    copy "she.exe" "%INSTALL_DIR%\she.exe" >nul
    echo Copied She++ executable to %INSTALL_DIR%
) else (
    echo Error: she.exe not found. Build may have failed.
    pause
    exit /b 1
)

REM Add to PATH if not already there
echo.
echo Adding She++ to system PATH...

for /f "skip=2 tokens=3*" %%A in ('reg query HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment /v Path') do set "CURRENT_PATH=%%A %%B"

echo %CURRENT_PATH% | find /I "%INSTALL_DIR%" >nul
if %errorLevel% equ 0 (
    echo She++ is already in PATH.
) else (
    setx /M Path "%CURRENT_PATH%;%INSTALL_DIR%"
    echo Added She++ to PATH successfully.
)

echo.
echo ========================================
echo     Installation Complete!
echo ========================================
echo.
echo To start using She++, open a new Command Prompt and run:
echo     she yourfile.she
echo.
echo Create a .she file and compile it:
echo     she myprogram.she
echo.
pause
