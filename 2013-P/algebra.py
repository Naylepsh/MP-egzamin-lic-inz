def nww(a, b):
    a_mult = a
    b_mult = b
    while a_mult <= a*b and b_mult <= a*b:
        print(a_mult, b_mult)
        if a_mult == b_mult:
            return a_mult

        if a_mult > b_mult:
            b_mult += b
        else:
            a_mult += a


def proper_nww(a, b):
    x = 1
    while x % a != 0 or x % b != 0:
        x += 1
    return x


print(nww(2, 6))
# print(proper_nww(1, 5))
