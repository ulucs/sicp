(define (make-mobile left right)
  (list left right))

(define (make-branch l structure)
  (list l structure))

;code starts here
;a.
(define left-branch car)
(define (right-branch x)
  (car (cdr x)))

(define branch-length car)
(define (branch-structure x)
  (car (cdr x)))

;b.
(define (branch-weight branch)
  (if (extends? (branch-structure branch))
    (mobile-weight (branch-structure branch))
    (branch-structure branch)))

(define (mobile-weight mobile)
  (+ (branch-weight
       (left-branch mobile))
     (branch-weight
       (right-branch mobile))))

(define extends? list?)

;c.
(define (is-balanced? mobile)
  (and
    (eq? (* (branch-length
              (left-branch mobile))
            (branch-weight
              (left-branch mobile)))
         (* (branch-length
              (right-branch mobile))
            (branch-weight
              (right-branch mobile))))
    (balanced-branch?
      (left-branch mobile))
    (balanced-branch?
      (right-branch mobile))))

(define (balanced-branch? branch)
  (if (extends? (branch-structure branch))
    (is-balanced? (branch-structure branch))
    #t))

;test cases before d.
;;weight 22, balanced
(define mob22t
  (make-mobile
    (make-branch 6 10)
    (make-branch
      5 (make-mobile
          (make-branch 6 4)
          (make-branch 3 8)))))
;;weight 25, unbalanced
(define mob25f
  (make-mobile
    (make-branch 6 11)
    (make-branch
      5 (make-mobile
          (make-branch 6 6)
          (make-branch 3 8)))))
(mobile-weight mob22t)
(is-balanced? mob22t)
(mobile-weight mob25f)
(is-balanced? mob25f)

;d pre
(define make-mobile cons)
(define make-branch cons)
;d.
(define left-branch car)
(define right-branch cdr)
(define branch-length car)
(define branch-structure cdr)
(define extends? pair?)

;verify it still works
;;weight 22, balanced
(define mob22t
  (make-mobile
    (make-branch 6 10)
    (make-branch
      5 (make-mobile
          (make-branch 6 4)
          (make-branch 3 8)))))
;;weight 25, unbalanced
(define mob25f
  (make-mobile
    (make-branch 6 11)
    (make-branch
      5 (make-mobile
          (make-branch 6 6)
          (make-branch 3 8)))))
(mobile-weight mob22t)
(is-balanced? mob22t)
(mobile-weight mob25f)
(is-balanced? mob25f)

