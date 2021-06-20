(define (compress xs)
  (define (walk ys prev)
    (cond
      [(empty? ys) ys]
      [(eq? (first ys) prev) (walk (cdr ys) prev)]
      [else (cons (first ys) (walk (cdr ys) (first ys)))]
    )
  )

  (if (empty? xs)
    xs
    (cons (first xs) (walk (cdr xs) (first xs)))
  )
)