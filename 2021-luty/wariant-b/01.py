def is_ab_seq(x: str):
    if x == '':
        return True
    return x.startswith('ab') and is_ab_seq(x[2:])


def is_in_lang(x: str):
    if x == '':
        return True
    xs = x.split('c')
    has_proper_ab_len = len(xs) == 3 and len(xs[0]) + len(xs[2]) == len(xs[1])
    has_proper_seqs = all(map(is_ab_seq, xs))
    if not has_proper_ab_len or not has_proper_seqs:
        return False

    ys = x.split('ab')
    return len(ys) == 2 and len(ys[0]) % 2 == 0 and len(ys[1]) % 2 == 0
