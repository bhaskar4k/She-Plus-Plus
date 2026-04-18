@echo off
REM She++ Language Uninstaller
setlocal enabledelayedexpansion

echo.
echo Uninstalling She++ Language...
echo.

REM Check if running as administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Error: This uninstaller must be run as Administrator.
    echo Please right-click this file and select "Run as administrator".
    pause
    exit /b 1
)

set "INSTALL_DIR=C:\Program Files\She++"

REM Remove installation directory
if exist "%INSTALL_DIR%" (
    rmdir /s /q "%INSTALL_DIR%"
    echo Removed installation directory: %INSTALL_DIR%
) else (
    echo She++ is not installed at %INSTALL_DIR%
)

echo.
echo Uninstall complete!
echo She++ has been removed from your system.
echo She will miss you :)
echo.
pause
