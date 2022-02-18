# -*- coding: utf-8 -*-

lst_main = [1, 2, -3, 0]


def merge_inner(temp_lst_inner1, temp_lst_inner2):
    temp_int_index1 = 0
    temp_int_index2 = 0
    temp_lst_return = []

    int_index_main = 0
    while int_index_main <= (len(temp_lst_inner1) + len(temp_lst_inner2)):

        if temp_int_index2 == len(temp_lst_inner2):
            for i in range(temp_int_index1, len(temp_lst_inner1)):
                temp_lst_return.append(temp_lst_inner1[i])
            break

        elif temp_int_index1 == len(temp_lst_inner1):
            for j in range(temp_int_index2, len(temp_lst_inner2)):
                temp_lst_return.append(temp_lst_inner2[j])
            break

        elif temp_lst_inner2[temp_int_index2] > temp_lst_inner1[temp_int_index1]:
            temp_lst_return.append(temp_lst_inner1[temp_int_index1])
            temp_int_index1 += 1

        elif temp_lst_inner1[temp_int_index1] > temp_lst_inner2[temp_int_index2]:
            temp_lst_return.append(temp_lst_inner2[temp_int_index2])
            temp_int_index2 += 1

        elif temp_lst_inner2[temp_int_index2] == temp_lst_inner1[temp_int_index1]:
            temp_lst_return.append(temp_lst_inner2[temp_int_index2])
            temp_int_index2 += 1

            temp_lst_return.append(temp_lst_inner1[temp_int_index1])
            temp_int_index1 += 1

    return temp_lst_return


def merge_sort(temp_lst_main):
    temp_lst_main = list(temp_lst_main)

    if len(temp_lst_main) == 1:
        return temp_lst_main

    else:
        # Breaking it into two parts

        temp_lst_left = merge_sort(temp_lst_main[:int(len(temp_lst_main) / 2)])
        temp_lst_right = merge_sort(temp_lst_main[len(temp_lst_main) // 2:])

        return merge_inner(temp_lst_left, temp_lst_right)


print(merge_sort(lst_main))
