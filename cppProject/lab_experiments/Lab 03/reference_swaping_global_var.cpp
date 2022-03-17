//
// Created by Vishal Paudel on 15/03/22.
//

#include <iostream>

using namespace std;

void swapping_reference(int &, int &);

int main() {
    int a = 5, b = 20;

    std::cout << " a " << a << " b " << b << std::endl;

    std::cout << "Starting the swapping" << std::endl;
    swapping_reference(a, b);

    std::cout << " a " << a << " b " << b << std::endl;

    return 0;
}

void swapping_reference(int &x, int &y) {

    int temp;

    temp = y;

    y = x;
    x = temp;
}
