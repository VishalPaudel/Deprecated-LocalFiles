class Grades(object):
    def __init__(self):
        self.dic = {1: ['1'], 2: [2]}

    def get_lst(self, code):
        return self.dic[code]


course1 = Grades()
course2 = Grades()

lst_1 = course1.get_lst(2)
lst_2 = course2.get_lst(1)

print(lst_1, type(lst_1))
print(lst_2, type(lst_2))

lst_1.extend(course2.get_lst(1))

print(lst_1)

print(lst_1)
