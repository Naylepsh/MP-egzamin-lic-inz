; a
(define (compress xs)
  (define (run prev count ys)
    (cond 
      [(empty? ys) (list (list prev count))]
      [(eq? (car ys) prev) (run prev (+ count 1) (cdr ys))]
      [else (cons (list prev count) (run (car ys) 1 (cdr ys)))]))
  (run (car xs) 1 (cdr xs)))

; b
(define (repeat-elem x n)
  (if (<= n 0)
    null
    (cons x (repeat-elem x (- n 1)))))

(define (compressed-value compressed) (first compressed))

(define (compressed-count compressed) (second compressed))

(define (decompress-single compressed)
  (repeat-elem (compressed-value compressed) (compressed-count compressed)))

; c
(define (decompress xss)
  (flatten (map decompress-single xss)))