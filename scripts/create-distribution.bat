@echo off
REM She++ Distribution Package Creator
REM Creates a ready-to-distribute package for end users

echo.
echo ========================================
echo  She++ Distribution Package Creator
echo ========================================
echo.

REM Change to project root directory
cd /d "%~dp0.."

REM Build the project
echo Building She++ compiler...
call scripts\build.bat
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
copy bin\she.exe dist\she.exe
copy scripts\install.bat dist\install.bat
copy scripts\uninstall.bat dist\uninstall.bat

REM Copy documentation
copy README.md dist\README.md
copy docs\SETUP_GUIDE.md dist\SETUP_GUIDE.md

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
echo   - uninstall.bat (Windows uninstaller)
echo   - README.md (Project overview)
echo   - SETUP_GUIDE.md (Setup instructions)
echo.
echo Next Steps:
echo   1. Zip the dist folder: "She++-v1.0.zip"
echo   2. Share with users
echo   3. Users extract and run install.bat
echo.
pause
