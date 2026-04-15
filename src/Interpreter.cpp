#include "../include/Interpreter.h"
#include <iostream>
#include <stdexcept>
#include <string>
using namespace std;

std::string Interpreter::eval(Expr* expr) {
    if (auto num = dynamic_cast<NumberExpr*>(expr))
        return num->value;

    if (auto str = dynamic_cast<StringExpr*>(expr))
        return str->value;

    if (auto var = dynamic_cast<VariableExpr*>(expr))
        return vars[var->name];

    if (auto bin = dynamic_cast<BinaryExpr*>(expr)) {
        long long left = stoll(eval(bin->left));
        long long right = stoll(eval(bin->right));
        long long result;
        
        if (bin->op == '+') result = left + right;
        else if (bin->op == '-') result = left - right;
        else if (bin->op == '*') result = left * right;
        else if (bin->op == '/') result = left / right;
        else throw runtime_error("Unknown operator");
        
        return to_string(result);
    }

    throw runtime_error("Eval error");
}

void Interpreter::exec(const std::vector<Stmt*>& stmts) {
    for (auto stmt : stmts) {

        if (auto num = dynamic_cast<NumberStmt*>(stmt)) {
            vars[num->name] = eval(num->value);
        }

        if (auto disp = dynamic_cast<DisplayStmt*>(stmt)) {
            std::cout << eval(disp->value) << std::endl;
        }
    }
}