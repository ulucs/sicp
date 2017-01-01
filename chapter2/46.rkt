#lang sicp
(define (make-vect x y)
  (cons x y))
(define (vec-add v w)
  (make-vect
   (+ (x-cord v)
      (x-cord w))
   (+ (y-cord v)
      (y-cord w))))
(define x-cord car)
(define y-cord cdr)
(define (vec-subs v w)
  (vec-add v
           (scal-mult w -1)))
(define (scal-mult v s)
  (make-vect
   (* (x-cord v) s)
   (* (y-cord v) s)))

(define v (make-vect 3 4))
(define w (make-vect 6 7))
(vec-add v w)
(vec-subs v w)

