
class Test:

    def test(self):
        pass


print(Test, type(Test))

print(Test.test, type(Test.test))

hehe = Test()

print(Test.__hash__(hehe))

