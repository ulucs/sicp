;standard accumulate function causes issues
;so we define it with the definition from
;our current chapter
(define (accumulate f i items)
  (if (null? items)
    i
    (f (car items)
       (accumulate f i (cdr items)))))
(accumulate + 0 '(1 2 3 4 5))

;code starts now
(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 1) (flatten t))))

(define (flatten items)
  (if (null? items)
    items
    (if (list? (car items))
      (append (flatten (car items))
              (flatten (cdr items)))
      (cons (car items)
            (flatten (cdr items))))))
(flatten '(((1 2)) (3 (4) ((5)))))

(count-leaves '(((1 2)) (3 (4) ((5)))))
