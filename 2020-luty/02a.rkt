(define (max-profit xs)
  (largest-difference xs))

(define (largest-difference xs)
  (define (find-largest-difference xs prev-max prev-largest)
    (if (empty? xs)
      prev-largest
      (let* ([current-max (if (> (first xs) prev-max) (first xs) prev-max)]
              [difference (- current-max (first xs))]
              [current-largest (if (> difference prev-largest) difference prev-largest)])
            (find-largest-difference (cdr xs) current-max current-largest))))
  (find-largest-difference (reverse xs) 0 0))
