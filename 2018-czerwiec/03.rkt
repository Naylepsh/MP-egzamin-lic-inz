(define (remove-single x xs)
  (cond 
    [(empty? xs) xs]
    [(eq? (first xs) x) (cdr xs)]
    [else (cons (first xs) (remove-single x (cdr xs)))]
  )
)

(define (min-in-list xs)
  (define (walk ys current-min)
    (cond
      [(empty? ys) current-min]
      [(< (first ys) current-min) (walk (cdr ys) (first ys))]
      [else (walk (cdr ys) current-min)]
    )
  )
  
  (walk xs (first xs))
)

(define (my-sort xs)
  (if (empty? xs)
    xs
    (let ([min-val (min-in-list xs)])
      (cons min-val (my-sort (remove-single min-val xs)))
    )
  )
)