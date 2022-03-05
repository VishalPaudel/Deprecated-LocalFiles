"""
Future: Further incorporate not integer inputs for expansion main_int, AMBITIOUS: non integer base n, main_int > 10

Author: Vishal Paudel
Motivation: To explain why the remainder method shows you the number in the associates base.
Scope: The current only runs with base up to 10 for n, and for only integer n and main_int

Last edited on: 23 March

Note: n represents the base for expansion, if main_int = 5, n = 2, then expand_in_base(5, 2) = '(2 * (2 * (1) + 0) + 1)'
"""


def expand_in_base_n(
        n: int,
        main_int: int,
):
    """

    :param n: INT  The base in which you want the expansion.
    :param main_int: INT  The number you want to expand.
    :return: main_str: STR  The expanded string.
    """
    count = 1
    main_str = '(' + str(main_int) + ')'

    while main_int > 1:

        main_int, remainder = main_int // n, main_int % n

        count_parenthesis = 0
        closing = False
        # print('count', count)
        i = 0

        # print('Main str', main_str, 'Evaluated', eval(main_str))
        while i < len(main_str):

            # print(main_str[i], i)

            if not closing:

                if main_str[i] == '(':
                    count_parenthesis += 1
                    start_index = i
                    # print('-----Hey I was called! --1', i)
                    if count_parenthesis == count:
                        # print('--shifting to closing parenthesis', i)
                        closing = True

            else:

                if main_str[i] == ')':

                    close_index = i
                    # print('-----Hey I was called! --2', i)
                    break

            i += 1

        try:
            a, b = start_index, close_index
        except Exception:
            raise Exception('There was some error in parenthesis management', main_str)

        # print('Internal ', main_str[start_index+1:close_index])
        main_str = main_str[:start_index+1] + str(n) + ' * (' + str(main_int) + ') + ' + str(remainder) + main_str[close_index:]

        del start_index
        del close_index

        count += 1

    return main_str


test_instance = expand_in_base_n(2, 65000)

print(test_instance)
print(eval(test_instance))
