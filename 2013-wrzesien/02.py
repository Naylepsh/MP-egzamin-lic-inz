def myRange(x, y):
    if x > y:
        return []
    return [x] + myRange(x+1, y)


def addToEach(x, xss):
    return list(map(lambda xs: [x] + xs, xss))


def foo(x, nums):
    first = nums[0]
    if x == first:
        return [[x]]
    if len(nums) == 1:
        return []
    withoutFirst = foo(x, nums[1:])
    withFirst = addToEach(first, foo(x - first, nums[1:]))
    return withoutFirst + withFirst


def numsSummingTo(x):
    return foo(x, myRange(1, x))


print(numsSummingTo(6))
