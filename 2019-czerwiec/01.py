def substr_before_char(text, final_char):
    length = 0
    for ch in text:
        if ch == final_char:
            break
        else:
            length += 1
    return text[:length]


def belongs_to_L1(word):
    before_bs = substr_before_char(word, 'b')
    after_bs = substr_before_char(word[::-1], 'b')
    rest = word[len(before_bs):(len(word)-len(after_bs))]

    as_before_bs = list(filter(lambda x: x == 'a', before_bs))
    as_after_bs = list(filter(lambda x: x == 'a', after_bs))
    bs_in_the_middle = list(filter(lambda x: x == 'b', rest))
    only_bs_in_the_middle = len(bs_in_the_middle) == len(rest)
    same_num_of_as_and_bs = len(as_after_bs) + \
        len(as_before_bs) == len(bs_in_the_middle)
    return only_bs_in_the_middle and same_num_of_as_and_bs


assert belongs_to_L1('aabb')
assert belongs_to_L1('cacaccbbc')
assert belongs_to_L1('abba')
assert belongs_to_L1('cccccabbaccc')
assert not belongs_to_L1('abcba')
