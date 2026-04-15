@echo off
REM She++ Quick Reference Guide
REM Opens documentation in default browser

echo.
echo Opening She++ Documentation Guide...
echo.

REM Try to open markdown files or create HTML version
if exist "..\docs\SETUP_GUIDE.md" (
    echo Opening SETUP_GUIDE.md
    start notepad.exe ..\docs\SETUP_GUIDE.md
) else (
    echo Files not found. Running in project directory...
    cd /d "%~dp0"
    dir
)

echo.
echo Available guides:
echo   - SETUP_GUIDE.md        ^(Start here!^)
echo   - GETTING_STARTED.md    ^(For end users^)
echo   - DISTRIBUTION.md       ^(Technical details^)
echo   - README.md             ^(Project overview^)
echo.
echo Quick Commands:
echo   - build.bat                    ^(Compile the project^)
echo   - create-distribution.bat      ^(Package for users^)
echo   - install.bat                  ^(Local installation^)
echo   - uninstall.bat                ^(Remove installation^)
echo.
