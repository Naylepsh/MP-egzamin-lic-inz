(define (my-set . xs)
  (cons "set" xs))

(define (my-set-symbol xs)
  (car xs))

(define (my-set-data xs)
  (cdr xs))

(define (my-set? xs)
  (define (is-set? xs)
    (if (empty? xs)
      #t
      (and (list? xs)
        (not (member (first xs) (cdr xs)))
        (is-set? (cdr xs)))))
  (and (list? xs) (eq? "set" (my-set-symbol xs)) (is-set? (my-set-data xs))))

(define (my-set-difference xs ys)
  (define (remove-vals xs vals)
    (if (empty? xs)
      xs
      (if (member (first xs) vals)
          (remove-vals (cdr xs) vals)
          (cons (first xs) (remove-vals (cdr xs) vals)))))

  (if (and (my-set? xs) (my-set? ys))
      (remove-vals (my-set-data xs) (my-set-data ys))
      "error"))

(writeln (my-set? (my-set 1 2 3)))
(writeln (my-set? (my-set 3 2 3)))
(writeln (my-set-difference (my-set 1 2 3) (my-set 0 1)))