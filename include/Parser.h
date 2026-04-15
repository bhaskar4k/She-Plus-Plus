#pragma once
#include <vector>
#include "Lexer.h"
#include "AST.h"

class Parser {
private:
    std::vector<Token> tokens;
    int pos = 0;

    Token peek();
    Token advance();

public:
    Parser(const std::vector<Token>& t);

    Expr* parseExpression();
    Expr* parsePrimary();
    Stmt* parseStatement();
    std::vector<Stmt*> parseProgram();
};