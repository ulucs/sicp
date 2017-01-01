#lang sicp
(#%require sicp-pict)
(define (up-split painter n)
  (if (eq? n 0)
      painter
      (below painter
             (beside (up-split painter (- n 1))
                     (up-split painter (- n 1))))))
(paint (up-split einstein 4))

;and now for trying out corner-split
(define (right-split painter n)
  (if (eq? n 0)
      painter
      (beside painter
              (below (right-split painter (- n 1))
                     (right-split painter (- n 1))))))
(define (corner-split painter n)
  (if (eq? n 0)
      painter
      (below
       (beside painter
               (below (right-split painter (- n 1))
                      (right-split painter (- n 1))))
       (beside (beside (up-split painter (- n 1))
                       (up-split painter (- n 1)))
               (corner-split painter (- n 1))))))
(paint (corner-split einstein 4))