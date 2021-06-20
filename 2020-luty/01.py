def belongs_to_lang(word):
    if len(word) == 0:
        return False

    openedParenthesis = 0
    prev = None

    for x in word:
        if x == '[':
            openedParenthesis += 1
            if prev not in ['[', '+', None]:
                return False
        elif x == ']':
            openedParenthesis -= 1
            if prev not in [']', '0', None]:
                return False
        elif x == '0':
            if prev not in ['[', '+', None]:
                return False
        elif x == '+':
            if prev not in [']', '0', None]:
                return False
        else:
            return False
        prev = x

    return openedParenthesis == 0


assert belongs_to_lang('[0]')
assert belongs_to_lang('[0]+[0]')
assert belongs_to_lang('[0+0+0]')
assert belongs_to_lang('[[0]]')
assert not belongs_to_lang('++')
assert not belongs_to_lang('[+]')
assert not belongs_to_lang('[[')
assert not belongs_to_lang('[]')
