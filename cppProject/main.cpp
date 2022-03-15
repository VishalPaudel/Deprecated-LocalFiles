#include <iostream>

using namespace std;

int main() {
    int x;
    std::cout << sizeof(x) << std::endl;
    char my_string[10];

    std::cin >> x;
    std::cin >> my_string;

    std::cout << x << std::endl;
    std::cout << my_string[0] << std::endl;
}
