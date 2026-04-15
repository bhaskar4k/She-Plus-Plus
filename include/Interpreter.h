#pragma once
#include <unordered_map>
#include <vector>
#include <string>
#include "AST.h"

class Interpreter {
private:
    std::unordered_map<std::string, std::string> vars; // Store as strings

public:
    std::string eval(Expr* expr);
    void exec(const std::vector<Stmt*>& stmts);
};