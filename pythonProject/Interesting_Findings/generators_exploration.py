
list_ = [1, 2, 3, 4]


def return_(temp_list_: list | tuple) -> list | tuple:
    x = 1
    print(f"In the first section {x}")

    yield 1

    x = x + 1
    print(f"In the second section {x}")

    for element in temp_list_:

        yield str(element) + " --A YIELD ELEMENT"

        x = x + 1
        print(f"In the third section {x}")

    x = x + 1
    print(f"In the fourth section {x}")


x_ = 1
for i in return_(list_):  # The execution does not happen each time, seperatly, but once in every iteration
    print("In the main")
    print(i)
