
int_initial_number = 4

int_current_base = 2


def base_conversion(temp_int_to_change: int, temp_int_base: int):
    if temp_int_to_change == 0:
        return [0]
    digits = []
    while temp_int_to_change:
        digits.append(int(temp_int_to_change % temp_int_base))
        temp_int_to_change //= temp_int_base
    return digits[::-1]


def break_number(temp_int_input: int):
    global int_current_base

    if temp_int_input <= int_current_base:
        return str(temp_int_input)

    else:

        list_base_conversions = base_conversion(temp_int_input, int_current_base)

        str_current = ''

        for temp_iterator in range(0, len(list_base_conversions)):

            temp_modified_iterator = len(list_base_conversions) - temp_iterator - 1

            temp_coefficient = str(list_base_conversions[temp_iterator])
            temp_str_base = str(int_current_base)
            temp_recursive = break_number(temp_modified_iterator)

            if temp_coefficient != 0:
                str_current += ' + ' + temp_coefficient + ' * ' + temp_str_base + '**(' + temp_recursive + ')'

        return str_current


def run_goldstein(temp_int_initial: int):
    global int_current_base

    temp_int_current = int(temp_int_initial)
    while temp_int_current > 0:
        print(temp_int_current, ' --> ', break_number(temp_int_current))

        # Performing A) Increasing the current base by one
        temp_str_current = ''

        for letter in break_number(temp_int_current):

            if letter == str(int_current_base):
                int_current_base += 1
                temp_str_current += str(int_current_base)
            else:
                temp_str_current += letter

        # Performing B) Reducing the total value by 1
        temp_int_current = eval(temp_str_current) - 1

    return


print(run_goldstein(int_initial_number))
