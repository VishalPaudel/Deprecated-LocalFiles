print("Hello world, Learning git")


class VishalError(Exception):
    """This a custom exception"""
    pass


def a_function(input_):
    try:
        a_ = int(input_)
        raise NameError('Vishal Error!')
    except:
        print('Sorry, cannot convert to integer')


a = '2'

a_function(a)
