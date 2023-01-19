#include <iostream>
#include "calcul/add.hpp"
#include "display/display.hpp"
#include "facto.hpp"

int main(int, char**) {
    std::cout << "Hello, world!\n";
    std::cout << "ADD: 2 + 3 = " << add(2, 3) << "\n";
    displ("Salut de disp()");

    Facto f(5);
    f.calc();
    std::cout << "Facto(5) = " << f.res << std::endl;

    return 0;
}
