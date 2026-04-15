#pragma once
#include <string>

enum class TokenType {
    EXEC_INIT,
    NUMBER_KW,
    DISPLAY,

    IDENTIFIER,
    NUMBER,
    STRING,

    PLUS,
    MINUS,
    TIMES,
    DIVIDE,
    EQUAL,

    LBRACKET,
    RBRACKET,

    END
};

struct Token {
    TokenType type;
    std::string value;
};

class Lexer {
private:
    std::string src;
    size_t pos = 0;

public:
    Lexer(const std::string& s);
    Token nextToken();

private:
    char peek();
    char advance();
    void skipWhitespace();
};