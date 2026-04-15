#include "../include/Lexer.h"
#include <cctype>

Lexer::Lexer(const std::string& s) : src(s) {}

char Lexer::peek() {
    return pos < src.size() ? src[pos] : '\0';
}

char Lexer::advance() {
    return pos < src.size() ? src[pos++] : '\0';
}

void Lexer::skipWhitespace() {
    while (isspace(peek())) advance();
}

Token Lexer::nextToken() {
    skipWhitespace();

    char c = peek();

    if (isdigit(c)) {
        std::string num;
        while (isdigit(peek())) num += advance();
        return {TokenType::NUMBER, num};
    }

    if (c == '"') {
        advance(); // skip opening quote
        std::string str;
        while (peek() != '"' && peek() != '\0') {
            str += advance();
        }
        advance(); // skip closing quote
        return {TokenType::STRING, str};
    }

    if (isalpha(c)) {
        std::string id;
        while (isalnum(peek())) id += advance();

        if (id == "ExecutionInitializer") return {TokenType::EXEC_INIT, id};
        if (id == "number") return {TokenType::NUMBER_KW, id};
        if (id == "display") return {TokenType::DISPLAY, id};

        return {TokenType::IDENTIFIER, id};
    }

    switch (advance()) {
        case '+': return {TokenType::PLUS, "+"};
        case '-': return {TokenType::MINUS, "-"};
        case '*': return {TokenType::TIMES, "*"};
        case '/': return {TokenType::DIVIDE, "/"};
        case '=': return {TokenType::EQUAL, "="};
        case '[': return {TokenType::LBRACKET, "["};
        case ']': return {TokenType::RBRACKET, "]"};
    }

    return {TokenType::END, ""};
}