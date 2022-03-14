//
// Created by Vishal Paudel on 10/03/22.
//

#include <iostream>
#include <ctime>

using namespace std;

int vir(int x);

int main() {

    cout << vir(3);
    return 0;
}

int vir(int x) {

    if (x == 0 || x == 1) {
        return 1;

    } else {
        return vir(x - 1) + vir(x - 2);

    }

    // Defensive program piece of code

    std::cout << difftime(finish, start) << "seconds";
    return 0;

}
