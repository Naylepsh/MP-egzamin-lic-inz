; naming it dict-set will conflict with built-in dict

; a
(define (entries-set dict key value)
    (cond 
      [(empty? dict) (list (list key value))]
      [(eq? (first (first dict)) key) (cons (list key value) (cdr dict))]
      [else (cons (first dict) (entries-set (cdr dict) key value))]))

(define (entries-get dict key)
  (cond 
    [(empty? dict) null]
    [(eq? (first (first dict)) key) (second (first dict))]
    [else (entries-get (cdr dict) key)]))

; b 
(define (count-ints ints)
  (define (run xs counts)
    (if (empty? xs)
      counts
      (let ([count (entries-get counts (car xs))])
        (run (cdr xs) (entries-set counts (car xs) (+ 1 (if (null? count) 0 count)))))))
  (run ints (list)))

; c
(define (rare? x counts)
  (define x-count (entries-get counts x))
  (define (run cs common-vals)
    (if (empty? cs)
      (<= x-count (/ common-vals 2))
      (run (cdr cs) (if (> (second (first cs)) x-count) (+ common-vals 1) common-vals))))
  (run counts 0))

(define (find-rares xs)
  (define counts (count-ints xs))
  (filter (lambda (x) (rare? x counts)) xs))