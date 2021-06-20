; 1
; paragraph
(define (make-p text) (list 'p text))

(define (p-text p) (second p))

(define (p? p)
  (and 
    (list? p)
    (eq? (length p) 2)
    (eq? (first p) 'p )))

; element
(define (make-elem tag children) (list 'elem tag children))

(define (elem-tag elem) (second elem))

(define (elem-children elem) (third elem))

(define (elem? elem)
  (and
    (list? elem)
    (eq? (length elem) 3)
    (eq? (first elem) 'elem )
    (andmap doc? (elem-children elem))))


; document
(define (doc? d) (or (p? d) (elem? d)))

; 2
; queries
(define paragraph? p?)

(define (elem-tag? tag) (lambda (elem) (and (elem? elem) (eq? (elem-tag elem) tag))))

; subqueries
(define (exec-in-children doc expr)
  (if (p? doc)
    (list p)
    (filter expr (elem-children doc))))

(define (exec-in-descendants doc expr)
  (if (p? doc)
    (filter expr (list doc))
    (let (
      [top-level (filter expr (elem-children doc))]
      [lower-levels (flatten (map (lambda (child) (exec-in-descendants doc expr)) (elem-children doc)))])
      (append top-level lower-levels))))

(define (assert actual expected) (if (eq? actual expected) #t (raise 'assert-failed #t)))
    
(define paragraph (make-p "lorem ipsum"))
(define doc1 (make-elem "article" (list paragraph)))
(assert (length (exec-in-children doc1 p?)) 1)

(define doc2 (make-elem "article" (list paragraph paragraph doc1)))
(assert (length (exec-in-children doc2 p?)) 2)
(assert (length (exec-in-children doc2 (elem-tag? "article"))) 1)
(assert (length (exec-in-children doc2 (elem-tag? "foo"))) 0)

(define doc3 (make-elem "article" (list doc2 doc2 paragraph)))
(assert (length (exec-in-descendants doc3 (elem-tag? "article"))) 4)