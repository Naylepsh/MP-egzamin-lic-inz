; a
(define (minOnList xs) (apply min xs))

(define (mySort xs)
  (if (null? xs) 
    null
    (let ([currentMin (min xs)])
      (cons currentMin (mySort (remove currentMin xs))))))

; b
(define (listLength xs)
  (define (run ys length)
    (if (null? ys)
      length
      (run (cdr ys) (+ length 1))))
  (run xs 0))

; c
(define (setSize xs)
  (define (run ys length)
    (if (null? ys)
      length
      (run (cdr ys) (if (member (car ys) (cdr ys)) length (+ length 1)))))
  (run xs 0))