#include "../include/Interpreter.h"
#include <iostream>
#include <stdexcept>
using namespace std;

long long Interpreter::eval(Expr* expr) {
    if (auto num = dynamic_cast<NumberExpr*>(expr))
        return stoll(num->value);

    if (auto var = dynamic_cast<VariableExpr*>(expr))
        return vars[var->name];

    if (auto bin = dynamic_cast<BinaryExpr*>(expr))
        return eval(bin->left) + eval(bin->right);

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