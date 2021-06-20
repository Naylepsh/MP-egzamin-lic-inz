(define (zip xs ys) (map cons xs ys))

(define (lexord xs)
  (lambda (ys) 
    (andmap (lambda (p) (<= (car p) (cdr p))) (zip xs ys))))
