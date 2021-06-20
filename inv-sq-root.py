def newton(f, f_derivative, epsilon=0.001, max_steps=1000):
    def solve(x):
        current_step = 0
        while abs(f(x)) > epsilon and current_step < max_steps:
            x = x - f(x) / f_derivative(x)
            current_step += 1
        return x

    return solve


def inv_sq_root(a):
    def f(x): return a - 1 / (x*x)
    def f_deriv(x): return 2 / (x*x*x)

    return newton(f, f_deriv)(1)


if __name__ == '__main__':
    print(inv_sq_root(2))
