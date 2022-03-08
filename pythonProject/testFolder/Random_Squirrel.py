import math

import matplotlib.pyplot as plt
import numpy


def immortal_rabbit(limit_iterations: int = 200):
    lst = [1]

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


def mortal_rabbit(
        limit_iterations: int,
        n_f: int,
        m: int,
        n_i: int
) -> list:
    """
    This is a portion of our mathematics Mini Project. Here the rabbit cannot come back once fell off from

    :param limit_iterations: Number of times the rabbit / drunkard is allowed to jump / make choice
    :param n_f: right position Death / Home
    :param m: initial position
    :param n_i: left position Death / casino
    :return: A list of final distrubution after limit_iterations
    """

    positions = list(range(n_f - n_i + 1))

    p_left = 0.5
    p_right = 0.5

    def add_top_two(temp_lst: list, temp_k: int) -> float:
        """Assumes p_left + p_right = 1"""

        # print('Adding', temp_lst[temp_k - 1], '&', temp_lst[temp_k + 1])

        return p_right * temp_lst[temp_k - 1] + p_left * temp_lst[temp_k + 1]

    def give_me_zeroes() -> list:
        """
        Assumes the size of zero list to be equal to defined positions list
        :return: list of N zeroes, N = length( positions ), positions is a predefined list
        """
        zero_lst = []

        for _ in range(len(positions)):
            zero_lst.append(0)

        return zero_lst

    main_lst = give_me_zeroes()
    main_lst[m - n_i] = 1

    left_die_lst = []
    right_die_lst = []

    plt.ion()
    fig = plt.figure()
    ax = fig.add_subplot(111)

    my_graph, = ax.plot([n_i - 1] + positions + [n_f + 1], [sum(left_die_lst)] + main_lst + [sum(right_die_lst)], 'b-')

    for row_index in range(limit_iterations):
        internal_lst = give_me_zeroes()

        for column_index in range(len(positions)):

            if column_index == 0:
                internal_lst[column_index] = 0.5 * main_lst[column_index + 1]
                left_die_lst.append(0.5 * internal_lst[column_index])

            elif column_index == n_f - n_i:
                internal_lst[column_index] = 0.5 * main_lst[column_index - 1]
                right_die_lst.append(0.5 * internal_lst[column_index])

            else:
                internal_lst[column_index] = add_top_two(main_lst, column_index)

        main_lst = internal_lst[:]

        my_graph.set_ydata([sum(left_die_lst)] + main_lst + [sum(right_die_lst)])
        # my_graph.set_color((abs(math.sin(row_index) * math.exp(-1 * (row_index + 1))), 0.5 + math.sin(row_index) * \
        #                     abs(math.exp(-2 * (row_index + 1))), abs(math.exp(-0.5 * (row_index + 1)))))

        plt.draw()
        plt.pause(0.01)

    return main_lst


mortal_rabbit(5000, 40, 15, 0)
