#include <iostream>
#include <typeinfo>

using namespace std;


int main() {
    std::cout << "Hello" << std::endl;
    unsigned hashval;

    cout << typeid(hashval).name() << endl;
    return 0;
}
