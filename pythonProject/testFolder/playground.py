import matplotlib.pyplot as plt
import numpy
import time

limit_iterations = 100

lst = [1]

n_i = 0
m = 2
n_f = 5

left_count = 1
right_count = 1

left_die_lst = []
right_die_lst = []

flag_left = False
flag_right = False

i = 0
count = 0

while count < limit_iterations:
    i += 1
    count += 1

    temp_lst = []
    k = 0
    while k < i - len(left_die_lst) - len(right_die_lst) + 1:

        if k == 0:

            if left_count > (m - n_i):

                value = 0.5 * lst[k]
                left_die_lst.append(value)
                left_count -= 2
                flag_left = True

            elif not flag_left:
                value = 0.5 * lst[k]
                temp_lst.append(value)

                k += 1
                left_count += 1

            else:
                value = 0.5 * lst[k] + 0.5 * lst[k + 1]
                temp_lst.append(value)

                k += 1
                left_count += 1
                flag_left = False

        elif k == i + 1 - len(left_die_lst) - len(right_die_lst) - 1:

            if right_count > (n_f - m):

                value = 0.5 * lst[k - 1]
                right_die_lst.append(value)
                right_count -= 1

            else:
                if len(left_die_lst) + len(right_die_lst) == 0:
                    value = 0.5 * lst[k - 1]
                else:
                    value = 0.5 * lst[k - 1 + (i + 1 - len(left_die_lst) - len(right_die_lst)) % 2]
                temp_lst.append(value)
                k += 1
                right_count += 1

        else:
            if len(left_die_lst) + len(right_die_lst) == 0:
                value = 0.5 * lst[k - 1] + 0.5 * lst[k]
            else:
                value = 0.5 * lst[k - 1 + (i + 1 - len(left_die_lst) - len(right_die_lst)) % 2] + 0.5 * lst[k + (i + 1 - len(left_die_lst) - len(right_die_lst)) % 2]

            temp_lst.append(value)
            k += 1

    lst = temp_lst

    plt.plot(numpy.linspace(0, len(lst) + 1, len(lst) + 2), [sum(left_die_lst)] + lst + [sum(right_die_lst)], 'b-')
    plt.draw()
    plt.pause(0.01)
    plt.close()


print(sum(left_die_lst) + sum(right_die_lst) + sum(lst) == 1)
