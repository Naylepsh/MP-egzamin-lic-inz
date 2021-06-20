import typing


class SExpr:
    def __init__(self, value) -> None:
        self.value = value


class SNumber(SExpr):
    def __init__(self, value: int) -> None:
        super().__init__(value)


class SSymbol(SExpr):
    def __init__(self, value: str) -> None:
        super().__init__(value)


class SSequence(SExpr):
    def __init__(self, value: typing.List[SExpr]) -> None:
        super().__init__(value)


def isNumber(x: str) -> bool:
    return all(map(lambda c: c.isdigit, x))


def isSymbol(x: str) -> bool:
    return


def isSequence(x: str) -> bool:
    isOuterSeq = len(x) >= 2 and x[0] == '(' and x[-1] == ')'
    isInnerSeq = isNumber(x) or isSymbol(x) or isSequence(x)
    return isOuterSeq and isInnerSeq


def toNumber(_x: str) -> int:
    # task says no need to implement
    return 42


def toSymbol(_x: str) -> str:
    # task says no need to implement
    return '42'


def toSExpr(x: str):
    if isNumber(x):
        return SNumber(toNumber(x))
    if isSymbol(x):
        return SSymbol(toSymbol(x))
    if isSequence(x):
        values = list(map(toSExpr, x.split(' ')))
        return SSequence(values)
    raise ValueError('Not parseable to S-Expr')
