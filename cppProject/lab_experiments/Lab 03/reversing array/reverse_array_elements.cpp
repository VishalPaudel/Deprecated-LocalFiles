//
// Created by Vishal Paudel on 15/03/22.
// Need to ask Sir Manoj, for a better and cleaner method
//

#include <iostream>
#include <fstream>
#include <string>


void reverse_my_arr(int *arr, const int &N_size) {
    /* Assumes array of int so "arr" needs to be int */
    int *initial_index, *end_index;

    initial_index = &(arr[0]);
    end_index = initial_index + N_size - 1;

    while (initial_index < end_index) {

        int temp = *initial_index;
        *initial_index = *end_index;
        *end_index = temp;

        initial_index++;
        end_index--;
    }

}


int main() {
    std::ifstream data_file("/Users/vishalpaudel/Documents/cppProject/lab_experiments/Lab 03/reversing array/data.txt");
    std::string line;
    int size_of_array = 0;
    int  *arr = new int[size_of_array];
    int count = -1;

    std::cout << "Running Main" << std::endl;

    while (getline(data_file, line)) {

        if (count == -1) {
            size_of_array = stoi(line);
        } else {

            arr[count] = stoi(line);
        }
        count++;
    }
    data_file.close();

    for (int i = 0; i < size_of_array; i++) {
        std::cout << arr[i] << std::endl;
    }
    std::cout << "----------Reversing the inout from the file" << std::endl;

    reverse_my_arr(arr, size_of_array);
    for (int i = 0; i < size_of_array; i++) {
        std::cout << arr[i] << std::endl;
    }

    delete[] arr;
    return 0;
}
