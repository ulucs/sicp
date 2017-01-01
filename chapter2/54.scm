(define (equal? list1 list2)
  (if (and (null? list1)
           (null? list2))
    #t
    (and (if (and (pair? (car list1))
                  (pair? (car list2)))
           (equal? (car list1)
                   (car list2))
           (eq? (car list1)
                (car list2)))
         (equal? (cdr list1)
                 (cdr list2)))))

(equal? '(1 2 (3 4) ((5 6) 7))
        '(1 2 (3 4) ((5 6) 7)))

(equal? '(1 2 (3 4) (5 6 7))
        '(1 2 (3 4) ((5 6) 7)))
