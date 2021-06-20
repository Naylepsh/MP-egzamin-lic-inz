import itertools


def all_strs(n, chars):
    return [''.join(x) for x in itertools.product(chars, repeat=n)]


def foo(n, chars):
    strings = all_strs(n, chars)
    return list(filter(lambda word: 'aa' not in word, strings))


def rec(n):
    if (n == 0):
        return 0
    if (n == 1):
        return 3
    if (n == 2):
        return 8
    return 2*rec(n-2)+2*rec(n-1)


def compare(n):
    print('py', len(foo(n, 'abc')))
    print('rec', rec(n))


compare(5)
