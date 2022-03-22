//
// Created by Vishal Paudel on 15/03/22.
//

#include <iostream>

using namespace std;

long long int printHailstones(long long int);


int main() {
    long long int guess_int;

    std::cout << "Hi user! Enter the initial value";
    std::cin >> guess_int;

    std::cout << "\nHi! I solved it for you... " << printHailstones(guess_int) << "Steps taken" << std::endl;
}


long long int printHailstones(long long int x) {
    long long int num_lifeSpan = 0;

    while (x > 1) {
        std::cout << x << std::endl;

        if (x % 2 == 0) {
            x = x / 2;
        } else {
            x = 3 * x + 1;
        }

        num_lifeSpan++;

    }

    return ++num_lifeSpan;
}
