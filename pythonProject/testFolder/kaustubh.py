class Node:
	def __init__(self, next, val):
		self.next = next
		self.val = val

last = Node(None, 5)
a = Node(last, 4)
b = Node(a, 3)
c = Node(b, 2)
d = Node(c, 1)

print(d.next.val)
