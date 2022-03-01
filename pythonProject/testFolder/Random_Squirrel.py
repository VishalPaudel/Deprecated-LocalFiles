
def odds(i, k):
    if 0 <= k <= i:
        print('Starting the machine')
    else:
        return -1

    if i == 0:
        return 1
    else:
        return 0.5 * odds(i - 1, k - 1) + 0.5 * odds(i - 1, k + 1)


print(odds(1000))
