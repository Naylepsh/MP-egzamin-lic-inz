def belongs(word: str):
    if len(word) == 0:
        return True

    if word.startswith('cc') and word.endswith('cc') and len(word) >= 4:
        return belongs(word[2:-2])
    if word.startswith(6*'a'):
        return belongs(word[6:])
    if word.startswith(6*'b'):
        return belongs(word[6:])
    return False


assert belongs('aaaaaa')
assert not belongs('aaaaaabb')
assert belongs('bbbbbb')
assert belongs('aaaaaabbbbbb')
assert belongs('cccc')
assert not belongs('ccc')
assert not belongs('ccccc')
