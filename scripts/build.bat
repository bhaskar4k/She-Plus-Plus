@echo off
cd /d "%~dp0.."
g++ src/main.cpp src/Lexer.cpp src/Parser.cpp src/Interpreter.cpp -I include -O2 -o bin/she.exe
echo Build complete: she.exe