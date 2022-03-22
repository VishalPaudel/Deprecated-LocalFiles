//
// Created by Vishal Paudel on 22/03/22.
//

#include <iostream>

using namespace std;

int my_str_len(char input_string[]);

int my_str_len(char input_string[]) {
    int len = 0;

    while (*input_string++)
        len++;

    return len;
}

int main() {
    char my_char[10];

    std::cout << "Hi user! Enter string: ";
    std::cin >> my_char;

    std::cout << my_str_len(my_char);

}
