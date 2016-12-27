(define (tree-map func items)
  (cond
    ((null? items)
     '())
    ((list? (car items))
     (append
       (list (tree-map func (car items)))
       (tree-map func (cdr items))))
    (else
      (append
        (list (func (car items)))
        (tree-map func (cdr items))))))

(define square-list
  (lambda (x)
    (tree-map (lambda (y) (* y y)) x)))

(square-list
  '(1 (2 (3 4) 5) (6 7)))

