(define (square-list items)
  (cond
    ((null? items)
      '())
    ((list? (car items))
      (append
        (list (square-list (car items)))
        (square-list (cdr items))))
    (else
      (append
        (list (* (car items) (car items)))
        (square-list (cdr items))))))

(square-list
  '(1 (2 (3 4) 5) (6 7)))
