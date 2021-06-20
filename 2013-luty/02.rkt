(define (get-divisors x)
  (define (divisors y div)
    (cond
      [(eq? y div) (cons div null)]
      [(eq? (modulo y div) 0) (cons div (divisors (/ y div) div))]
      [else (divisors y (+ div 1))]))
  (divisors x 2))

(define (prime? x) (eq? (length (get-divisors x)) 1))

(define (max-jednorodny x)
  (define (compute divs prev prev-max current)
    (cond
      [(empty? divs) (max prev-max current)]
      [(eq? prev (car divs)) (compute (cdr divs) prev prev-max (* current (car divs)))]
      [else (compute (cdr divs) (car divs) (max prev-max current) (car divs))]))
  (compute (get-divisors x) null 0 1))