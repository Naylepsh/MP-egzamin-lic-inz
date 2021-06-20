(define (starts-with xs ys)
  (cond 
    [(empty? xs) (empty? ys)]
    [(empty? ys) #t]
    [(eq? (first xs) (first ys)) (starts-with (cdr xs) (cdr ys))]
    [else #f]
  )
)

(define (is-in xs ys)
  (cond 
    [(starts-with xs ys) #t]
    [(empty? xs) #f]
    [else (is-in (cdr xs) ys)]
  )
)