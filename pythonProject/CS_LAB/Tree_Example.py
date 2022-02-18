
class Human:

    def __init__(self, data_point):

        self.data_point = data_point
        self.children = []

    def add_child(self, child_object):

        if child_object is None:
            return
        else:
            self.children.append(child_object)

    def amitabh(self):
        if len(self.children) == 0:
            return self.data_point
        else:
            print(self.data_point)
            for i in self.children:
                return i.amitabh()


class Children(Human):

    def __init__(self, data_point):

        super().__init__(data_point)


p1 = Human(5)
c1 = Children(-10)
c2 = Children(-1)
c3 = Children(-20)
c4 = Children(-30)

p1.add_child(c1)
c1.add_child(c3)
c3.add_child(c2)
c1.add_child(c2)

print(p1.amitabh())
