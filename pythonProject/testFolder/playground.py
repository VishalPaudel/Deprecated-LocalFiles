import math
from matplotlib import pyplot as plt

def return_count(my_list):

    count = 0

    def getBinaryRep(n, numDigits):
        nonlocal count
        """Assumes n and numDigits are non-negative ints
        Returns a numDigits str that is a binary
        representation of n"""
        result = ''
        count += 1

        while n > 0:
            result = str(n % 2) + result
            count += 1

            n = n // 2
            count += 1

        if len(result) > numDigits:
            raise ValueError('not enough digits')

        for _ in range(numDigits - len(result)):
            result = '0' + result
            count += 1

        return result

    def genPowerset(L):
        nonlocal count
        """Assumes L is a list
        Returns a list of lists that contains all possible combinations of the elements of L. E.g., if
        L is [1, 2] it will return a list with elements [], [1], [2], and [1,2]."""
        powerset = []
        count += 1

        for i in range(0, 2**len(L)):
            binStr = getBinaryRep(i, len(L))
            count += 1

            subset = []
            count += 1

            for j in range(len(L)):

                if binStr[j] == '1':

                    subset.append(L[j])
                    count += 1

            powerset.append(subset)
            count += 1

        return powerset

    genPowerset(my_list)

    return count


lst = []

for i in range(0, 20):

    lst.append(math.log(return_count(range(i))))

plt.plot(range(0, 20), lst)
plt.show()
