(define (num-of-occurrences x xs)
  (define (walk xs n)
    (if (empty? xs) 
      n
      (walk (cdr xs) (if (= (car xs) x) (+ n 1) n))))
  (walk xs 0))

(define (sort-bits xs)
  (define (create-sorted-bit-list zeros ones)
    (cond 
      [(> zeros 0) (cons 0 (create-sorted-bit-list (- zeros 1) ones ))]
      [(> ones 0) (cons 1 (create-sorted-bit-list zeros (- ones 1)))]
      [else null]))
  (define zeros (num-of-occurrences 0 xs))
  (define ones (num-of-occurrences 1 xs))
  (create-sorted-bit-list zeros ones))