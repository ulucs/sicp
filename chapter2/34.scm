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
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ (* x higher-terms)
                   this-coeff))
              0 coefficient-sequence))
(horner-eval 2 '(1 3 0 5 0 1))
