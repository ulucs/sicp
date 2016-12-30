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
(define (map p sequence)
  (accumulate (lambda (x y)
            (cons (p x)
                  y))
          '() sequence))
(map square '(1 2 3 4))

(define (append seq1 seq2)
  (accumulate cons
          seq2 seq1))
(append '(1 2 3 4) '(5 6 7))

(define (length sequence)
  (accumulate (lambda (x y)
            (+ 1 y))
          0 sequence))
(length '(1 2 3 4 5 6))
