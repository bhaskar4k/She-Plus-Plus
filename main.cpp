#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>

#include "Lexer.h"
#include "Parser.h"
#include "Interpreter.h"

int main(int argc, char* argv[]) {
    if (argc < 2) {
        std::cout << "Usage: shepp <file.shepp>\n";
        return 1;
    }

    std::ifstream file(argv[1]);
    if (!file) {
        std::cerr << "Cannot open file\n";
        return 1;
    }

    std::stringstream buffer;
    buffer << file.rdbuf();
    std::string code = buffer.str();

    Lexer lexer(code);
    std::vector<Token> tokens;

    while (true) {
        Token t = lexer.nextToken();
        tokens.push_back(t);
        if (t.type == TokenType::END) break;
    }

    Parser parser(tokens);
    Interpreter interpreter;

    auto program = parser.parseProgram();
    interpreter.exec(program);

    return 0;
}