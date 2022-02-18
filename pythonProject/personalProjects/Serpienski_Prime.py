# -*- coding: utf-8 -*-

import math

int_odd_rows = int(input('Please enter the number of rows: '))


str_1 = '1'
str_0 = '0'

lst_main = []

row_index = 0
while row_index < int_odd_rows:
    lst_main.append([])

    # Creating a empty container of size n * (2*n - 1)
    for int_InnerIterator in range(0, 2 * int_odd_rows - 1):
        lst_main[row_index].append(str_0)

    row_index += 1

# Inserting 1's in the diagonals
for int_row_iterate in range(0, len(lst_main)):

    int_width = 2 * len(lst_main) - 1

    int_side_gap = int((int_width - (2 * int_row_iterate + 1)) / 2)
    print(int_side_gap)

    lst_main[int_row_iterate][0 + int_side_gap] = str_1
    lst_main[int_row_iterate][-1 * int_side_gap - 1] = str_1

# Doing the inner computations
print(int_row_iterate)


for i in lst_main:
    for j in i:
        print(j, end='')

    print()
