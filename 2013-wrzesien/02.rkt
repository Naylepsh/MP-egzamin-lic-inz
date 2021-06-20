(define (add-to-each x xss)
  (map (lambda (xs) (cons x xs)) xss))

(define (nums-summing-to x)
  (define (run y nums)
    (define first-num (car nums))
    (cond 
      [(eq? y first-num) (list (list y))]
      [(null? (cdr nums)) (list)]
      [else (let ([without-first (run y (cdr nums))]
                  [with-first (add-to-each first-num (run (- y first-num) (cdr nums)))])
                  (append without-first with-first))]))
  (run x (range 1 (+ x 1))))

(writeln (nums-summing-to 6))