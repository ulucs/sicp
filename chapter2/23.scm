(define (for-each l items)
  (map l items)
  '())

(for-each (lambda (x) (* x x)) '(1 2 3 4 5))
(for-each (lambda (x) (newline) (display x))
          '(57 321 88))
