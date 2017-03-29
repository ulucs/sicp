;sets as ordered lists
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) #t)
        ((< c (car set)) #f)
        (else element-of-set? x (cdr set))))

;presume (car set) to be larger than x
;then we'll just cons it to the front
;so we only need to enforce it
;and skip the operation if we ever ecounter equality
(define (adjoin-set x set)
  (let ((s1 (car set)))
    (cond ((= x s1)
           set)
          ((< x s1)
           (cons x set))
          ((> x s1)
           (cons s1
                 (adjoin-set x (cdr set)))))))

(adjoin-set 5 '(2 4 6 8))
(adjoin-set 3 '(2 3 4 6))
(adjoin-set 1 '(3 5 7 9))
