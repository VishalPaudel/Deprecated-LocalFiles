//
// Created by Vishal Paudel on 29/03/22.
//

#include <iostream>


using namespace std;


// Declaring the functions in this program file

void fill_array(int ARR[], int SIZE_ARRAY);
// Asks user for inputs, SIZE_ARRAY many times and fills it in ARR[0] to ARR[SIZE_ARRAY - 1]

void print_array(int ARR[], int SIZE_ARRAY);
// Prints out the contents of ARR[0] to ARR[SIZE_ARRAY - 1]


void fill_array(int ARR[], int SIZE_ARRAY) {
    /*
     * Asks user for inputs, SIZE_ARRAY many times and fills it in ARR[0] to ARR[SIZE_ARRAY - 1]
     *
     * INPUT: int* ARR, an array name / memory location
     * OUTPUT: void, returns nothing, JUST fills out the original array, as ARR is a pointer
     *
     * Some side notes:
     * this may overflow the array size, and mess with other processes in the RAM
     * */

    cout << "Start entering the elements, " << SIZE_ARRAY << " times: " << endl << " ";
    for (int i = 0; i < SIZE_ARRAY; ++i) {
        cin >> ARR[i];
        cout << " ";
    }
    cout << endl;

    return;
}


void print_array(int ARR[], int SIZE_ARRAY) {
    /*
     * Prints out the contents of ARR[0] to ARR[SIZE_ARRAY - 1]
     *
     * INPUT: int* ARR, aka int ARR[], an arr-name / memory-location
     * OUTPUT: void, returns void, BUT prints out the whole ARR on the console.
     *
     * This may overflow the ARR and print values of unknown processes in the RAM
     * */

    cout << "Starting to print the elements, " << SIZE_ARRAY << " times: " << endl;
    for (int i = 0; i < SIZE_ARRAY; ++i) {
        cout << ARR[i] << " ";
    }
    cout << endl;

    return;
}


int main() {
    int N;
    cout << "Enter the size of the array: ";
    cin >> N;

    int* main_arr = new int[N];

    fill_array(main_arr, N);  // fills the array with user inputs.
    print_array(main_arr, N);  // prints the array on the console.

    // Changing the size of main_arr and seeing what happens:
    int original_N = N;  // remembering the original size before we change the size
    int* original_location = main_arr;  // remember the previous location of the array

    cout << "Enter the new size for the same array: ";
    cin >> N;
    cout << endl;

    cout << "array elements with new size: ";
    print_array(main_arr, N);

    cout << "array elements with original size: ";
    print_array(main_arr, original_N);

    cout << "array elements with original size and original location: ";
    print_array(original_location, original_N);

    if (original_location == main_arr) {
        cout << "Original location has not changed in the heap";
    }
    else {
        cout << "Original location of the array has changed in the heap";
    }

    return 0;
}
