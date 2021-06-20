def max_gain(xs):
    def walk(ys):
        if len(ys) == 1:
            return (ys[0], 0)
        maxSell, maxDiff = walk(ys[1:])
        bestSell = max(maxSell, ys[0])
        return [bestSell, max(maxDiff, bestSell - ys[0])]

    _, diff = walk(xs)
    return diff


assert max_gain([1, 2, 3, 0]) == 2
assert max_gain([1, 2, 3, 0, 6]) == 6
assert max_gain([8, 4, 2, 1]) == 0
