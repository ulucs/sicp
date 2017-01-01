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
           (scal-mult -1 w)))
(define (scal-mult s v)
  (make-vect
   (* (x-cord v) s)
   (* (y-cord v) s)))

(define (frame-cord-map frame)
  (lambda (v)
    (vec-add
     (origin-frame frame)
     (vec-add (scal-mult (x-cord v)
                         (edge1-frame frame))
              (scal-mult (y-cord v)
                         (edge2-frame frame))))))
;;list defs
;(define (make-frame origin edge1 edge2)
;  (list origin edge1 edge2))
;;selectors
;(define origin-frame car)
;(define edge1-frame cadr)
;(define edge2-frame caddr)
;((frame-cord-map (make-frame (make-vect 3 4)
;                            (make-vect 7 7)
;                            (make-vect -3 -3)))
; (make-vect 1 -1))

;cons defs
(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define origin-frame car)
(define edge1-frame cadr)
(define edge2-frame cddr)
((frame-cord-map (make-frame (make-vect 3 4)
                            (make-vect 7 7)
                            (make-vect -3 -3)))
 (make-vect 1 -1))