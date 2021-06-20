; a
(define (rev xs)
  (define (run ys acc)
    (if (null? ys) 
      acc
      (run (cdr ys) (cons (car ys) acc))))
  (run xs null))

; b (jest gorsza, bo tworzy nieuzytki)
(define (rev-alt xs)
  (if (null? xs)
    xs
    (append (rev-alt (cdr xs)) (list (car xs)))))

; c
(define (listToNumber xs)
  (define (run ys mult acc)
    (if (null? ys)
      acc
      (run (cdr ys) (* mult 10) (+ acc (* (car ys) mult)))))
  (run (rev xs) 1 0))

; d
(define (numberToList x)
  (define (run y)
    (if (< y 10)
      (cons y null)
      (cons (modulo y 10) (run (/ (- y (modulo y 10)) 10)))))
  (rev (run x)))