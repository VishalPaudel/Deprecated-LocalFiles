//
// Created by Vishal Paudel on 09/04/22.
// Need to ask Manoj Sir for better implementation
//

#include "iostream"

char *encrypt(const char *input_string, const int &encryption_key) {
    int size = 0;
    char *encrypted = new char[size];

    for (int i = 0; input_string[i] != '\0'; i++) {
        size++;
        encrypted[size - 1] = input_string[i] + encryption_key;
    }

    return encrypted;
}

int main() {
    char *encrypted = encrypt("Apple", -2);
    std::cout << encrypted << std::endl;
}
