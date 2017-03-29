;sets as binary-trees
(define entry car)
(define left-branch cadr)
(define right-branch caddr)

(define (make-tree u l r) (list u l r))

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= x (entry set)) #t)
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set)
                    (left-branch set)
                    (adjoin-set x (right-branch set))))))


(define (list->tree elements)
  (car (partial-tree elements
                     (length elements))))

;a little lambda calculus ain't hurt nobody
(define (zero x) (lambda (y) y))
(define (one x) (lambda (y) (x y)))
(define (nf f n)
  (cond ((eq? n 0) (zero f))
        ((eq? n 1) (one f))
        (else
          (lambda (y)
            (f ((nf f (- n 1)) y))))))

(define (partial-tree elements n)
  (cond
    ((or (null? elements)
         (zero? n))
     (list '() 0))
    ((or (null? (cdr elements))
         (eq? n 1))
     (list (make-tree
             (car elements)
             '()
             '()) 'l))
    (else
      (let ((sublist-length (quotient (- n 1) 2)))
        (let ((right-elements ((nf cdr
                                   (+ sublist-length 1))
                               elements))
              (right-length (- n (+ sublist-length 1))))
          (list
            (make-tree
              (car ((nf cdr sublist-length) elements))
              (car (partial-tree elements sublist-length))
              (car (partial-tree right-elements right-length)))
            0))))))

(list->tree '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15))

;a.
;get list
;take median element
;previous parts is left branch
;next parts are right branch

;b.
;we do O(n) work each recursion
;we divide into two parts
;each half length
;so that makes O(n*logn)
