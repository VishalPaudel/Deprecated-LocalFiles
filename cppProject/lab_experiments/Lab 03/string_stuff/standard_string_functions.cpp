//
// Created by Vishal Paudel on 09/04/22.
//

#include <iostream>
#include <cstring>

int main() {

    char main_string[6] = "Hello";

    std::cout << std::strlen(main_string) << " -- is the string length" << std::endl;
    char copied_string[6];

    std::strcpy(copied_string, main_string);
    std::cout << copied_string << " has been copied" << std::endl;

    std::cout << std::strcmp(copied_string, main_string) << " --- compared two strings lexo graphically" << std::endl;

    std::cout << std::strstr(main_string, "ell") << " ---searched for a substring" << std::endl;
}
