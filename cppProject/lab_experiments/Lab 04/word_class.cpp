//
// Created by Vishal Paudel on 22/03/22.
//

#include <iostream>
#include <cstring>

using namespace std;

class word {
private:
    static const int N = 50;  // fixes the sizes of all our word members / word objects

public:
    char arr[N];  // creating our empty array

    word() { strcpy(arr,""); }  // an empty constructor for empty initialisations
    word(const char *s) { strcpy(arr,s); }  // for a non-empty initialisation


    void getword() {
        /*
         * Takes input a user typed stuff as an input "this->arr"
         * Overwrites each time this happens
         * */
        cout << "Enter the word to be stored in w1: ";
        cin >> this->arr;
    }

    void printword() {
        // just couts the array of our word
        cout << this->arr << endl;
    }

    int wordlen() {
        // returns the length of our word object, takes elements only upto \0 in "this->arr"
        int len = 0;

        char *input_string = (this->arr);  // initialises the pointer value to be the location of this->arr's first element

        while (*input_string != '\0') {
            // while the value in input_string location is not \0

            input_string++;
            len++;
        }

        return len;
    }

    int no_occ(char c) {
        char *p = arr;  // again, initialises the pointer to the begining of the arr
        int count = 0;  // stores the times of occurrence

        while (*p) {
            // runs only till *p is not \0
            if (*p == c) {
                // the value at pointer location is c character

                count++;
            }

            p++;  // moving the checking process forward, by shifting the pointer location to right
        }
        return count;
    }

    char * append(const char * s) {
        // takes some array as input, w2 = word(); s must be w.arr

        if (this->wordlen() + strlen(s) + 1 > N) {
            // the sum of the lengths plus 1 for the \0 should be less than or at most equal to the arr size N
            // code comes here if it does not

            cout << "The world is small, and space limited" << endl;
            return this->arr;
        }
        else {
            // other-wise just concatenates this->arr array and the s array

            return strcat(this->arr, s);
        }
    }

    char * operator+ (word w) {
        // uses the inbuilt to concatenate
        return strcat(this->arr, w.arr);
    }

    bool isPalin() {
        // checks if the word is a palindrome or not
        char temp[N];

        strcpy(temp,arr);
        if (strcmp(strrev(temp),arr) == 0)

            return 1;
        else
            return 0;
    }

    char * strrev(char *s) {
        /* This member function reverses the string s without using any other additional array!
        */
        int count = 0;

        char temp_char;
        // we cannot use a temporary array, but we can use a temporary pointer just as in the swapping exercise

        char * starting_pointer = s;
        char * end_pointer = s + strlen(s) - 1;

        while (count < strlen(s) / 2) {

            temp_char = *starting_pointer;
            // stores the starting position

            *starting_pointer = *end_pointer;

            *end_pointer = temp_char;
            // swap complete

            starting_pointer++;
            end_pointer--;
            // right hand size pointer reduced and left increased
            count++;
        }

        return s;
    }


};

int main() {
    word w1, w2("Plaksha ");
    w1.getword();

    if (w1.isPalin() == 1)
        cout << "Palindrome\n";
    else
        cout << "Not palindrome\n";

    w1.append(w2.arr);
    w1.printword();

    cout << w1 + w2 << endl;
    w1.printword();
    return 0;
}
