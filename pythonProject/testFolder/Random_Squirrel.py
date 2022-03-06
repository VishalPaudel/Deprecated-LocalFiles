import copy

import matplotlib.pyplot as plt
import time
import numpy


def immortal_rabbit(limit_iterations: int = 200, immortal: bool = False):
    lst = [1]

    n_i = 0
    m = 4
    n_f = 10

    i = 0

    while i < limit_iterations:

        i += 1

        temp_lst = numpy.array([])
        for k in range(0, i + 1):

            try:
                if (k - 1) >= 0:
                    left_value = lst[k - 1]
                else:
                    left_value = 0

            except IndexError:
                left_value = 0
            try:
                right_value = lst[k]
            except IndexError:
                right_value = 0

            temp_lst = numpy.append(temp_lst, [0.5 * left_value + 0.5 * right_value])

        lst = temp_lst

        plt.bar(numpy.linspace(0, len(lst) - 1, len(lst)), lst)
        plt.draw()
        plt.pause(0.01)
        plt.close()


