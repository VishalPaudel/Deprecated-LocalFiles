# -*- coding: utf-8 -*-

from matplotlib import pyplot as plt

n = 14

num_size = 2 * n + 1


def prime_fractal(temp_num_rows: int, temp_int_base: int):\

    """
    This replicates the MATLAB function zeros, but in our context of THE fractal
    :param temp_num_rows: The number of rows you want in your fractal
    :param temp_int_base: The base in which you want the fractal
    :return: temp_main_lst: a list of lists containing zeros
    """

    temp_main_lst = []

    temp_num_columns = 2 * temp_num_rows - 1

    for row_index in range(0, temp_num_rows):
        temp_main_lst.append([])

        for column_index in range(0, temp_num_columns):
            temp_main_lst[row_index].append(0)

    for row_index in range(0, temp_num_rows):

        if row_index == 0:
            temp_main_lst[row_index][temp_num_rows - 1] = 1
        else:
            for column_index in range(0, temp_num_columns):

                if column_index == 0:
                    left_val = 0
                    right_val = temp_main_lst[row_index - 1][column_index + 1]

                    temp_main_lst[row_index][column_index] = right_val + left_val

                elif column_index == temp_num_columns - 1:
                    left_val = temp_main_lst[row_index - 1][column_index - 1]
                    right_val = 0

                    temp_main_lst[row_index][column_index] = right_val + left_val

                else:
                    left_val = temp_main_lst[row_index - 1][column_index - 1]
                    right_val = temp_main_lst[row_index - 1][column_index + 1]

                    temp_main_lst[row_index][column_index] = right_val + left_val

    for row_index in range(0, temp_num_rows):

        for column_index in range(0, temp_num_columns):

            temp_main_lst[row_index][column_index] %= temp_int_base

    return temp_main_lst


plt.imshow(prime_fractal(int(input("Enter the size: ")), int(input("Input base: "))), interpolation='nearest')
plt.show()
