(define (subsets s)
  (if (null? s)
    (list '())
    (let ((rest (subsets (cdr s))))
      (append rest
              (map
                (lambda (x) (cons (car s) x))
                rest)))))

(subsets
  '(1 2 3 4))

;first we obtain an empty list through recursion
;now we have the empty set
;through map, we append the last element we got with car to it
;now we have () and (n)
;again, we append the second last element to those two
;resulting in () (n) (n-1) (n-1 n)
;through recursion, we add the previous elements
;and get the whole list of subsets
