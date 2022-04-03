//
// Created by Vishal Paudel on 08/03/22.
//

#include <iostream>

using namespace std;

int main() {
    int start = 1;

    for (int i = 0; i < 12; i++) {

        start  *= 100;
        std::cout << i << start << endl;
    }

    std::cout << "Finished with int" << std::endl;

    long int l_start = 1;

    for (int i = 0; i < 12; i++) {

        l_start *= 100;
        std::cout << i << l_start << std::endl;
    }

    std::cout << "Finished with long int" << std::endl;

    long long int ll_start = 1;

    for (int i = 0; i < 12; i++) {

        ll_start *= 100;
        std::cout << i << ll_start << std::endl;
    }

    std::cout << "Finished with long long int" << std::endl;
}
