#lang sicp
(#%require sicp-pict)
(define (split dir1 dir2)
  (define (dsplit painter n)
    (if (eq? 0 n)
        painter
        (dir1 painter
              (dir2 (dsplit painter (- n 1))
                    (dsplit painter (- n 1))))))
  dsplit)
(define up-split (split below beside))
(define right-split (split beside below))
(paint (up-split einstein 3))
(paint (right-split einstein 3))