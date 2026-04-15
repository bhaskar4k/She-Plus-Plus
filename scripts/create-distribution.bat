@echo off
REM She++ Distribution Package Creator
REM Creates a ready-to-distribute package for end users

echo.
echo ========================================
echo  She++ Distribution Package Creator
echo ========================================
echo.

REM Build the project
echo Building She++ compiler...
call build.bat
if %errorLevel% neq 0 (
    echo Error: Build failed.
    pause
    exit /b 1
)

REM Remove old distribution folder
if exist "dist" (
    echo Cleaning up old distribution folder...
    rmdir /s /q dist
)

REM Create distribution folder structure
echo Creating distribution package...
mkdir dist

REM Copy executables and scripts
copy ..\bin\she.exe dist\she.exe
copy install.bat dist\install.bat
copy uninstall.bat dist\uninstall.bat
copy install-ps.ps1 dist\install-ps.ps1
copy uninstall-ps.ps1 dist\uninstall-ps.ps1

REM Copy documentation
copy ..\docs\GETTING_STARTED.md dist\GETTING_STARTED.md
copy ..\docs\README.md dist\README.md

echo.
echo ========================================
echo  Package Created Successfully!
echo ========================================
echo.
echo Location: .\dist\
echo.
echo Contents:
echo   - she.exe (Compiled interpreter)
echo   - install.bat (Windows installer)
echo   - install-ps.ps1 (PowerShell installer)
echo   - uninstall.bat (Windows uninstaller)
echo   - uninstall-ps.ps1 (PowerShell uninstaller)
echo   - GETTING_STARTED.md (User guide)
echo   - README.md (Project overview)
echo.
echo Next Steps:
echo   1. Zip the dist folder: "She++-v1.0.zip"
echo   2. Share with users
echo   3. Users extract and run install.bat
echo.
pause
