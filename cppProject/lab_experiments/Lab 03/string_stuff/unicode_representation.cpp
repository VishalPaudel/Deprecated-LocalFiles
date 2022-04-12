//
// Created by Vishal Paudel on 09/04/22.
// Code not working, need to ask Manoj Sir
//

#include <iostream>

void print_unicode_representation(char *input_word) {
    for (char i = 0; input_word[i] != '\0'; i++) {
        std::cout << i << " - " << (unsigned char) input_word[i] << std::endl;
    }
}

int main() {
    char word[16] = "विशाल";
    std::cout << word << std::endl;

    print_unicode_representation(word);
}
