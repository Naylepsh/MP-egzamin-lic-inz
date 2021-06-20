; a
(define (bin-tree? t)
  (or? (node? t)
       (leaf? t)))

(define (node? x)
  (and (list? x)
       (= (length x) 4)
       (eq? (first x) 'node )
       (bin-tree? (third x))
       (bin-tree? (fourth x))))

(define (leaf? x) (eq? x 'leaf ))

; c
(define (abs x) (if (< x 0) (* -1 x) x))
(define (left t) (third t))
(define (right t) (fourth t))

(define (balanced? tree)
  (define (get-balance t)
    (if (leaf? t)
      (cons 0 #t)
      (let* ([left-balance (get-balance (left t))]
             [right-balance (get-balance (right t))])
            (cons (+ (max (car left-balance) (car right-balance)) 1)
                  (and (cdr left-balance)
                       (cdr right-balance)
                       (<= (abs (- (car left-balance) (car right-balance))) 1))))))
  (cdr (get-balance tree)))
