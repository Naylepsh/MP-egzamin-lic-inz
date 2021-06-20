(define (foo expr)
    (cond
      [(eq? expr '0 ) #f]
      [(eq? expr '1 ) #t]
      [(eq? (car expr) '+ ) (ormap foo (cdr expr))]
      [(eq? (car expr) '* ) (andmap foo (cdr expr))]))

(writeln (foo '(+ 0 1) ))