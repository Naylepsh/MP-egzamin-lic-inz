; a
(define (allMult k)
  (if (= k 1)
    (list (list 1) (list -1))
    (let* (
      [res (allMult (- k 1))]
      [withPlusOne (map (lambda (xs) (cons 1 xs)) res)]
      [withMinusOne (map (lambda (xs) (cons -1 xs)) res)])
      (append withPlusOne withMinusOne))))

; b
(define (dotProduct xs)
  (define (run xs ys)
    (if (null? xs)
      0
      (+ (* (car xs) (car ys)) (run (cdr xs) (cdr ys)))))
  (lambda (ys) (run xs ys)))

; c
(define (good? xs)
  (lambda (k)
    (define mults (allMult (length xs)))
    (define products (map (dotProduct xs) mults))
    (> (length (filter (lambda (res) (= res k)) products)) 0)))