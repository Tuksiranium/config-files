#include "facto.hpp"

Facto::Facto(int n)
    : a(n), res(n)
{ }

void Facto::calc()
{
    if (a <= 1) return;
    a--; res *= a; Facto::calc();
}