@echo off
g++ main.cpp Lexer.cpp Parser.cpp Interpreter.cpp -O2 -o she
echo Build complete: she.exe