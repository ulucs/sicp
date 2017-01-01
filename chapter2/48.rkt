#lang sicp
(#%require sicp-pict)
(define (make-segment start end)
  (cons start end))
(define start-segment car)
(define end-segment cdr)
