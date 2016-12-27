(define (deep-reverse items)
  (if (null? items)
    items
    (append (deep-reverse (cdr items))
            (list
              (if (list? (car items))
                (deep-reverse (car items))
                (car items))))))

(deep-reverse '(1 2 3 4))
(deep-reverse '((1 2) (3 4)))
(deep-reverse '(((1 2)) (3 4 5)))
