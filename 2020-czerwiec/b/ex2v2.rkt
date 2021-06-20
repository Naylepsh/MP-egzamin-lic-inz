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

(define (elem-tag? tag) (lambda (elem) (and (elem? elem) (eq? (elem-tag elem) tag))))

; document
(define (doc? d) (or (p? d) (elem? d)))

; 2
(define (p?? expr)
  (and 
    (list? expr)
    (eq? (length expr) 1)
    (eq? (car expr) 'p? )))

(define (elem-tag?? expr) 
  (and 
    (list? expr) 
    (eq? (length expr) 2) 
    (eq? (car expr) 'tag? )
    (string? (cadr expr))))

(define (in-children?? expr) 
  (and 
    (list? expr) 
    (eq? (length expr) 2) 
    (eq? (car expr) 'in-children? )))

(define (in-descendants?? expr) 
  (and 
    (list? expr) 
    (eq? (length expr) 2) 
    (eq? (car expr) 'in-descendants? )))

(define (subquery query) (cadr query))

(define (doc-children doc) (caddr doc))

(define (flatten-once lst)
  (apply append lst))

(define (doc-descendants doc)
  (if (p? doc)
    null
    (let* ([children (doc-children doc)]
          [descendants (flatten-once (map doc-descendants (doc-subquerable children)))])
      (append children descendants))))

(define (doc-subquerable docs) (filter (lambda (doc) (not (p? doc))) docs))

; sample queries
;; '(p?)
;; '(tag? "article")
;; '(in-children? (tag? "article")
;; '(in-children? (in-children? (tag? "article")))
;; '(in-descendants? (p?))'

(define (select-children expr children)
  (if (empty? children)
    children
    (let ([res (expr (car children))])
      (cond 
        [(eq? res #f) (select-children expr (cdr children))]
        [(eq? res #t) (cons (car children) (select-children expr (cdr children)))]
        [else (append res (select-children expr (cdr children)))]))))

(define (select query)
  (lambda (doc)
    (cond 
      [(p?? query) (p? doc)]
      [(elem-tag?? query) ((elem-tag? (cadr query)) doc)]
      [(in-children?? query) 
        (if (p? doc)
          #f
          (select-children (select (subquery query)) (doc-children doc)))]
      [(in-descendants?? query)
        (if (p? doc)
          #f
          (select-children (select (subquery query)) (doc-descendants doc)))])))

(define (assert actual expected) (if (eq? actual expected) #t (raise 'assert-failed #t)))

(define lorem (make-p "lorem-ipsum"))
; p tests
(define query1 '(p?))
(define doc1 lorem)
(assert ((select query1) doc1) #t)

; tag tests
(define query2 '(tag? "article"))
(define doc2 (make-elem "article" (list lorem lorem)))
(assert ((select query2) doc2) #t)

(define query3 '(tag? "article"))
(define doc3 (make-elem "heading" (list lorem lorem)))
(assert ((select query3) doc3) #f)

; children query tests
(define query4 '(in-children? (p?)))
(define doc4 (make-elem "heading" (list lorem lorem)))
(define res4 ((select query4) doc4))
(assert (length res4) 2)
(assert (length (filter p? res4)) 2)

(define query5 '(in-children? (tag? "article")))
(define subdoc5 (make-elem "article" (list lorem)))
(define doc5 (make-elem "heading" (list subdoc5 lorem)))
(define res5 ((select query5) doc5))
(assert (length res5) 1)
(assert (length (filter (elem-tag? "article") res5)) 1)

(define query6 '(in-children? (in-children? (p?))))
(define res6 ((select query6) doc5))
(assert (length res6) 1)
(assert (length (filter p? res6)) 1)

; descendants query tests
(assert (length (doc-descendants doc5)) 3)
(define x (doc-descendants doc5))

(define query7 '(in-descendants? (p?)))
(define res7 ((select query7) doc5))
(assert (length res7) 2)
(assert (length (filter p? res7)) 2)

