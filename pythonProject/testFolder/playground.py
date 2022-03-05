import time
import matplotlib.pyplot as plt

lst = [[1]]

m = 4
n = 10

i = 0
while True:
    time.sleep(1)
    i += 1

    lst.append([])

    for k in range(0, i + 1):

        try:
            if (k - 1) >= 0:
                left_value = lst[i - 1][k - 1]
            else:
                left_value = 0
        except IndexError:
            left_value = 0
        try:
            right_value = lst[i - 1][k]
        except IndexError:
            right_value = 0

        lst[i].append(0.5 * left_value + 0.5 * right_value)

    fig, ax = plt.subplots()
    ax.plot([i for i in range(0, len(lst))], lst)

