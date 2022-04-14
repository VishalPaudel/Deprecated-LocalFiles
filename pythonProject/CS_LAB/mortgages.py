"""

Author: --
Original Source: MIT Press, Guttag, John V., Introduction to Python Programing, Second Edition (p. 132-134)

Note: This was Refactored to learn OOP concepts like Information Hiding, name mangling in python, Encapsulation etc.
Scope: also the TwoRate is not giving the same answer as in the book, I don't know why!

Refactor: Need to add proper comments and doc strings

Vishal Paudel (vishal.paudel@plaksha.edu.in)

"""


def find_payment(loan: float, rate: float, months: int):
    return loan * ((rate * (1 + rate) ** months) / ((1 + rate) ** months - 1))


class Mortgage(object):

    def __init__(self, loan: float, ann_rate: float, months: int):
        self.loan = float(loan)
        self.ann_rate = float(ann_rate / 12)
        self.months = int(months)

        self.paid = [0.0]
        self.outstanding = [loan]
        self.payment = find_payment(self.loan, self.ann_rate, self.months)

        self.legend = str(None)

    def _make_payment(self):
        self.paid.append(self.payment)
        reduction = self.payment - self.outstanding[-1] * self.ann_rate

        self.outstanding.append(self.outstanding[-1] - reduction)

    def _get_total_paid(self):
        return sum(self.paid)

    def __str__(self):
        return self.legend


class Fixed(Mortgage):

    def __init__(self, loan: float, ann_rate: float, months: int):
        super().__init__(loan, ann_rate, months)

        self.legend = 'Fixed, ' + str(round(ann_rate * 100, 2)) + '%'

    def make_payment(self):
        return Mortgage._get_total_paid(self)

    def get_total_paid(self):
        return Mortgage._get_total_paid(self)


class FixedWithPts(Mortgage):

    def __init__(self, loan: float, ann_rate: float, months: int, pts: float):
        super().__init__(loan, ann_rate, months)

        self.pts = pts
        self.paid = [loan * (pts / 100)]

        self.legend = 'Fixed, ' + str(round(ann_rate * 100, 2)) + '%, ' \
                      + str(pts) + ' points'

    def make_payment(self):
        return Mortgage._get_total_paid(self)

    def get_total_paid(self):
        return Mortgage._get_total_paid(self)


class TwoRate(Mortgage):
    def __init__(self, loan: float, ann_rate: float, months: int, teaser_rate: float, teaser_months):
        super().__init__(loan, ann_rate, months)

        self.teaser_months = teaser_months
        self.teaser_rate = teaser_rate
        self.next_rate = ann_rate / 12

        self.legend = str(teaser_rate * 100) \
                      + '% for ' + str(self.teaser_months) \
                      + ' months, then ' + str(round(ann_rate * 100, 2)) + '%'

    def get_total_paid(self):
        return Mortgage._get_total_paid(self)

    def make_payment(self):
        if len(self.paid) == self.teaser_months + 1:
            self.ann_rate = self.next_rate
            self.payment = find_payment(self.outstanding[-1],
                                        self.ann_rate,
                                        self.months - self.teaser_months)

        Mortgage._make_payment(self)


def compare_mortgages(amt, years, fixed_rate, pts,
                      pts_rate, var_rate_1, var_rate_2, var_months):
    tot_months = years * 12

    fixed1 = Fixed(amt, fixed_rate, tot_months)
    fixed2 = FixedWithPts(amt, pts_rate, tot_months, pts)
    two_rate = TwoRate(amt, var_rate_2, tot_months, var_rate_1, var_months)

    morts = [fixed1, fixed2, two_rate]

    for m in range(tot_months):

        for mort in morts:
            mort.make_payment()

    for m in morts:
        print(m)
        print('     Total payments = $' + str(int(m.get_total_paid())))


compare_mortgages(amt=200000, years=30, fixed_rate=0.07,
                  pts=3.25, pts_rate=0.05, var_rate_1=0.045, var_rate_2=0.095, var_months=48)
