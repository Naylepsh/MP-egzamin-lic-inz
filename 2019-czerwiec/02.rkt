(define (get-from-P key P)
  (if (empty? P)
    '()
    (let* ([entry (first P)]
           [entry-key (first entry)]
           [entry-value (second entry)])
      (if (eq? key entry-key)
         entry-value
         (get-from-P key (cdr P))))))

; ???