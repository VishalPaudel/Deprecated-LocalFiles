//
// Created by Vishal Paudel on 22/03/22.
//

#include <iostream>
#include <cstring>

using namespace std;

class word
{
private:
    static const int N = 50;

    char arr[N];

public:

    word() { strcpy(arr, ""); }

    word(const char *s) { strcpy(arr, s); }

    void get_word() {
        cin >> this->arr;
    }

    void print_word() {
        std::cout << this->arr << std::endl;
    }

    int word_len() {
        int len = 0;

        char *input_string = (this->arr);

        while (*input_string++)
            len++;

        return len;
    }
};

int main() {

    word w1("Plaksha "), w2("Hello ");

    w1.get_word();
    w2.get_word();

//    cout << "Word 1 is palindrome " << w1.is_palin();

    w1.print_word();
    w2.print_word();

    std::cout << w1.word_len() << std::endl;

    return 0;
}
