#pragma once
#include <unordered_map>
#include <vector>
#include "AST.h"

class Interpreter {
private:
    std::unordered_map<std::string, long long> vars;

public:
    long long eval(Expr* expr);
    void exec(const std::vector<Stmt*>& stmts);
};