
n = 14

num_size = 2 * n + 1


#  Creating zeroes
def create_zeros(temp_num_size):
    temp_main_lst = []

    for row_index in range(0, temp_num_size):
        temp_inner_lst = []

        for column_index in range(0, temp_num_size):
            temp_inner_lst.append(0)

        temp_main_lst.append(temp_inner_lst)

    return temp_main_lst


print(create_zeros(num_size))
