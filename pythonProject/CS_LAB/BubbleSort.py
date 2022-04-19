
lst_main = [3, 4, 1, 2]
lst_side = [1, 4, 2, 3]


def bubble_sort(temp_lst_main, temp_lst_side, bool_mute=False):
    """
    This function is the normal replication of bubble sort algorithm. <wiki_link>.
    (list, bool=False) --> list

    :param temp_lst_main: The list that you want to sort
    :param temp_lst_side: The list you want to manipulate side by side
    :param bool_mute: Pass True if you don't want to see print statements
    :return: temp_lst_main: A deep copy of your list only sorted ascending order
    """
    temp_lst_main = list(temp_lst_main)
    temp_lst_side = list(temp_lst_side)

    int_outer_index = 0
    int_swap_count = 0
    while int_outer_index < (len(temp_lst_main)):

        int_inner_index = 0
        while int_inner_index < (len(temp_lst_main) - int_outer_index - 1):

            if temp_lst_main[int_inner_index] > temp_lst_main[int_inner_index + 1]:
                """
                New swapper found!
                """

                temp_lst_main[int_inner_index], temp_lst_main[int_inner_index + 1] = temp_lst_main[int_inner_index + 1], \
                                                                                     temp_lst_main[int_inner_index]
                temp_lst_side[int_inner_index], temp_lst_side[int_inner_index + 1] = temp_lst_side[int_inner_index + 1], \
                                                                                     temp_lst_side[int_inner_index]
                if not bool_mute:
                    print('|\nSwap Happened\n|', temp_lst_main, sep='\n')
                int_swap_count += 1

            int_inner_index += 1
            if not bool_mute:
                print('|\nCounter shifted\n|', temp_lst_main, sep='\n')

        if int_swap_count == 0:
            if not bool_mute:
                print('|\nThe List was already Sorted !\n')
            break

        int_outer_index += 1

    if not bool_mute:
        print('\n' + str(int_swap_count), 'time swaps')

    return temp_lst_main, temp_lst_side


print(bubble_sort(lst_main, lst_side, True))
print(lst_main)
