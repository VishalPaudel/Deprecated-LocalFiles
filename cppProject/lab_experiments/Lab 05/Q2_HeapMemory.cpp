//
// Created by Vishal Paudel on 29/03/22.
//

#include <iostream>

using namespace std;

int main() {

    int arr_size = 4;
    int main_arr[arr_size];

    int counter = 0;
    int neg_counter = 0;
    while (counter < arr_size) {
        cin >> main_arr[counter];
        if (main_arr[counter] < 0) {
            neg_counter++;
        }

        counter++;
    }

    counter = 0;
    int inner_counter = 0;
    int* new_arr = new int[neg_counter];

    while (counter < arr_size) {
        if (main_arr[counter] < 0) {
            new_arr[inner_counter] = main_arr[counter];
            inner_counter++;
        }

        counter++;
    }

    for (int i=0; i<neg_counter; ++i) {
        cout << new_arr[i] << endl;
    }

    delete[] new_arr;
    return 0;
}
