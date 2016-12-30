(define (reverse sequence)
  (fold-right (lambda (x y)
                (append y
                        (list x))) '() sequence))
(reverse '(1 2 3 4))

(define (reverse sequence)
  (fold-left (lambda (x y)
               (append (list y)
                       x)) '() sequence))
(reverse '(1 2 3 4))
