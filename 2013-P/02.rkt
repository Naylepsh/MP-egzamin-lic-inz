(define (last-digit-of x)
  (modulo x 10)
)

(define (digits-of x)
  (if (< x 10)
    (list x)
    (append 
      (digits-of (floor (/ x 10))) 
      (list (last-digit-of x))
    )
  )
)

(define (sum xs)
  (if (empty? xs)
    0
    (+ (first xs) (sum (cdr xs)))
  )
)

(define (product xs)
  (if (empty? xs)
    1
    (* (first xs) (product (cdr xs)))
  )
)

(define (divisible? x y)
  (= (modulo x y) 0)
)

(define (interesting? x)
  (define digits (digits-of x))
  (define x-sum (sum digits))
  (define x-product (product digits))
  (and
    (divisible? x x-sum)
    (divisible? x x-product)
  )
)