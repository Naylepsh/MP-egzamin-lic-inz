; a
(define (quicksort xs)
  (if (or (null? xs) (null? (cdr xs)))
    xs
    (let* ([pivot (car xs)]
      [ys (quicksort (filter (lambda (x) (< x pivot)) xs))]
      [ss (filter (lambda (x) (= x pivot)) xs)]
      [zs (quicksort (filter (lambda (x) (> x pivot)) xs))])
      (append ys ss zs))))

; b
(define (common xs ys)
  (define (run as bs)
    (cond 
      [(or (null? as) (null? bs)) null]
      [(> (car as) (car bs)) (run as (cdr bs))]
      [(< (car as) (car bs)) (run (cdr as) bs)]
      [else (cons (car as) (run (cdr as) (cdr bs)))]))
  (run (quicksort xs) (quicksort ys))))