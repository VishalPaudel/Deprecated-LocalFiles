
#include <iostream>

using namespace std;

int main() {

    int i = 1, size = 0;

    while (i > 0) {
        size++;
        i <<= 1;
    }

    size++;
    cout << size / 8;
    return 0;
}
