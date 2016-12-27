(define (last-pair list)
  (if (null? (cdr list))
    list
    (last-pair (cdr list))))

(last-pair '(1 2 3 4))
