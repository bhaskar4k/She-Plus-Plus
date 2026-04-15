#pragma once
#include <string>

/* =========================
   AST
========================= */

struct Expr {
    virtual ~Expr() = default;
};

struct NumberExpr : Expr {
    std::string value;
    NumberExpr(std::string v) : value(v) {}
};

struct VariableExpr : Expr {
    std::string name;
    VariableExpr(std::string n) : name(n) {}
};

struct BinaryExpr : Expr {
    Expr* left;
    Expr* right;
    BinaryExpr(Expr* l, Expr* r) : left(l), right(r) {}
};

struct Stmt {
    virtual ~Stmt() = default;
};

struct NumberStmt : Stmt {
    std::string name;
    Expr* value;
    NumberStmt(std::string n, Expr* v) : name(n), value(v) {}
};

struct DisplayStmt : Stmt {
    Expr* value;
    DisplayStmt(Expr* v) : value(v) {}
};