;standard accumulate function causes issues
;so we define it with the definition from
;our current chapter
(define (accumulate f i items)
  (if (null? items)
    i
    (f (car items)
       (accumulate f i (cdr items)))))
(accumulate + 0 '(1 2 3 4 5))

;code starts here
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    '()
    (cons (accumulate op init (first-items seqs))
          (accumulate-n op init (later-items seqs)))))
(define (first-items seqs)
  (accumulate (lambda (x y)
                (cons (car x) y))
              '()
              seqs))
(define (later-items seqs)
  (accumulate (lambda (x y)
                (cons (cdr x) y))
              '()
              seqs))

(accumulate-n + 0 '((1 2 3)
                  (4 5 6)
                  (7 8 9)
                  (10 11 12)))

