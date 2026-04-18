#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>

#include "../include/Lexer.h"
#include "../include/Parser.h"
#include "../include/Interpreter.h"

using namespace std;


bool HasSheExtension(const std::string& filename) {
    return filename.size() >= 4 &&
           filename.substr(filename.size() - 4) == ".she";
}


int main(int argc, char* argv[]) {
    if (argc < 2) {
        cout << "From the developer (-_-)\n"
             << "==============================\n"
             << "If something is missing in your life, it's probably because you're not using She++.\n"
             << "When She doesn't understand you, then She++ does. 😃\n"
             << "==============================\n"
             << "\n"
             << "Version : v1.0\n"
             << "Usage : she <filename.she> or she <filename>\n";
        return 1;
    }

    string filename = argv[1];

    // Step 1: Auto-append .she if missing
    if (filename.find('.') == string::npos) {
        filename += ".she";
    }

    // Step 2: Validate extension
    if (!HasSheExtension(filename)) {
        cerr << "Error: Only .she files are supported\n";
        return 1;
    }

    // Step 3: Open file
    ifstream file(filename);
    if (!file) {
        cerr << "Cannot open file: " << filename << "\n";
        return 1;
    }

    // Step 4: Read file
    stringstream buffer;
    buffer << file.rdbuf();
    string code = buffer.str();

    // Step 5: Lexing
    Lexer lexer(code);
    vector<Token> tokens;

    while (true) {
        Token t = lexer.nextToken();
        tokens.push_back(t);
        if (t.type == TokenType::END) break;
    }

    // Step 6: Parsing
    Parser parser(tokens);
    Interpreter interpreter;

    auto program = parser.parseProgram();

    // Step 7: Execution
    interpreter.exec(program);

    return 0;
}