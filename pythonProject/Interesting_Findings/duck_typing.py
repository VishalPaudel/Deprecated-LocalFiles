
import types


class Foo(object):
    pass


foo = Foo()


def sample_method(self, bar, baz):
    return bar + baz


foo.sample_method = types.MethodType(sample_method, Foo)

print(foo.sample_method(1, 2))

foo2 = Foo

Foo.sample_method = types.MethodType(sample_method, Foo)


print(foo2.sample_method(3, 4))
