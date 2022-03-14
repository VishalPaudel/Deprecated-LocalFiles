//
// Created by Vishal Paudel on 10/03/22.
//

#include <iostream>
#include <ctime>

using namespace std;

long long int vir(long long int x);

int main() {

    std::cout << vir(91) << std::endl;

    return 0;
}

long long int vir(long long int x) {

    time_t start, finish;

    time(&start);  /* Here starts the clock */

    long long int num_1 = 1;
    long long int num_2 = 1;

    long long int index = 0;

    while (index + 1 < x) {
        long long int num_temp = num_2;

        num_2 = num_2 + num_1;
        num_1 = num_temp;

        index++;
    }

    time(&finish);  /* Clock stops here */

    std::cout << difftime(finish, start) << std::endl;

    return num_2;
}
