;; a)
(define (set? expr symbol)
  (and 
    (list? expr)
    (eq? (length expr) 2)
    (eq? (first expr) 'set )
    (list? (second expr))))

(define (set-val s) (second expr))

(define (binop? expr symbol)
  (and 
    (list? expr)
    (eq? (length expr) 3)
    (eq? (first expr) symbol)
    (set? (second expr))
    (set? (third expr))))

(define (union? expr) (binop? expr 'union ))

(define (intersection? expr) (binop? expr 'intersection ))

(define (difference? expr) (binop? expr 'difference ))
     
(define (binop-left expr) (second expr))

(define (binop-right expr) (third expr))


;; b)
(define (eval-difference s1 s2)
  (define (diff s1 s2)
    (cond 
      [(empty? s1) s1]
      [(member? (car s1) s2) (diff (cdr s1) (cdr s2))]
      [else (cons (car s1) (diff (cdr s1) s2))]))
  (list 'set (diff (set-val s1) (set-val s2))))


;; c)
(define (eval expr)
  (cond
    [(set? expr) expr]
    [(union? expr) (eval-union s1 s2)]
    [(intersection? expr) (eval-intersection s1 s2)]
    [(difference? expr) (eval-difference s1 s2)]
    [else #f]))