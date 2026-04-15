#include "Parser.h"
#include <stdexcept>

Parser::Parser(const std::vector<Token>& t) : tokens(t) {}

Token Parser::peek() {
    return tokens[pos];
}

Token Parser::advance() {
    return tokens[pos++];
}

Expr* Parser::parsePrimary() {
    Token t = advance();

    if (t.type == TokenType::NUMBER)
        return new NumberExpr(t.value);

    if (t.type == TokenType::IDENTIFIER)
        return new VariableExpr(t.value);

    throw std::runtime_error("Invalid expression");
}

Expr* Parser::parseExpression() {
    Expr* left = parsePrimary();

    while (peek().type == TokenType::PLUS) {
        advance();
        Expr* right = parsePrimary();
        left = new BinaryExpr(left, right);
    }

    return left;
}

Stmt* Parser::parseStatement() {
    Token t = advance();

    if (t.type == TokenType::NUMBER_KW) {
        std::string name = advance().value;
        advance(); // =
        Expr* val = parseExpression();
        return new NumberStmt(name, val);
    }

    if (t.type == TokenType::DISPLAY) {
        advance(); // [
        Expr* val = parseExpression();
        advance(); // ]
        return new DisplayStmt(val);
    }

    throw std::runtime_error("Invalid statement");
}

std::vector<Stmt*> Parser::parseProgram() {
    std::vector<Stmt*> stmts;

    advance(); // ExecutionInitializer
    advance(); // [

    while (peek().type != TokenType::RBRACKET) {
        stmts.push_back(parseStatement());
    }

    advance(); // ]

    return stmts;
}