def partition(n, m):
    print(f"called {n} | {m}", end=" and ")
    if n == 1 or n == 0:
        return 1
    elif m > n:
        return partition(n, n)
    else:
        # print('Between ', n - m, "and", n - 1)
        sum_rec = 0
        if n - m < 0:
            for i_modified in range(n - 1, -1, -1):
                sum_rec += partition(i_modified, m)
        else:
            for i_modified in range(n - 1, n - m - 1, -1):
                sum_rec += partition(i_modified, m)

        return sum_rec


print(partition(3, 3))
