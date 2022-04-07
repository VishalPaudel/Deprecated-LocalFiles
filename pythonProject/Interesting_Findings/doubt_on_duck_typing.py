import types


class Foo(object):

    def __init__(self):
        self.inner_lst = [1, 2, 3, 4, 5]


def my_method(self):

    print("The return function was called")

    lst = self.inner_lst[:]

    return lst

foo = Foo()

Foo.my_method = types.MethodType(my_method, Foo)

for i in foo.my_method():
    print(i)
