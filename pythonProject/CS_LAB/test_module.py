

def a_method(int_input):
    """
    INPUT: integers/partial integers
    OUTPUT: 2 * input
    """

    return int_input * 2


engineer_pi = 3


class MyOwn:
    """A class for vishal objects"""

    def __init__(self, name: str, role: str, weight: int, *args, **kwargs):
        self.name = name
        self.role = role
        self.weight = weight

        self.others = args

        for (key, value) in kwargs.items():
            print(key, type(key))
            self.key = value

        pass

    class InnerClass:

        def __init__(self):
            self.anger = 'Grrrr'

        def inner_print(self):
            print(self.anger)

        pass


test_vishal = MyOwn('vishal', 'student', 70)

anger_vishal = MyOwn.InnerClass()

anger_vishal.inner_print()
