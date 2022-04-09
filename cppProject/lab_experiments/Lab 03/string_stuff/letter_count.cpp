//
// Created by Vishal Paudel on 09/04/22.
//

#include <iostream>
// #include <cstring>


int return_count(const char &letter, const char *the_word);


char *take_letters();


char *take_letters() {
    int size_of_word = 0;
    char *the_word = new char[size_of_word];


    std::cout << "Please enter a word" << std::endl;

    bool continue_flag = true;
    char the_letter;
    while (continue_flag and size_of_word <= 40) {
        size_of_word++;

        if (std::cin.peek() != '\n') {
            std::cin >> the_letter;
            the_word[size_of_word - 1] = the_letter;
        } else {
            continue_flag = false;
        }
    }

    the_word[size_of_word - 1] = '\0';

    // std::cout << size_of_word << std::endl;

    // delete[] the_word; // need to ask Sir Manoj about how to de
    return the_word;
}


int return_count(const char &letter, const char *the_word) {
    int count = 0;

    int iterator = 0;
    while (iterator < sizeof(the_word)) {
        if (tolower(the_word[iterator]) == letter) {
            count++;
        }

        iterator++;
    }

    return count;
}


int main() {

    char *word = take_letters();

    std::cout << "Printing the word" << std::endl;
    std::cout << word << std::endl;

    char letter_to_count;
    std::cout << "Please enter a letter you want to search for " << std::endl;
    std::cin >> letter_to_count;

    std::cout << letter_to_count << " appeared " << return_count(letter_to_count, word) << " times. " << std::endl;

    for (char i = 'a'; i <= 'z'; i++) {

        std::cout << i << " appeared " << return_count(i, word) << " times" << std::endl;
    }

    delete[] word;
    return 0;
}
