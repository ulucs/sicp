(define (fringe items)
  (if (null? items)
    items
    (if (list? (car items))
      (append (fringe (car items))
              (fringe (cdr items)))
      (cons (car items)
            (fringe (cdr items))))))

(define x '(1 2 3 4))
(fringe x)
(fringe (list x x))
(fringe (list (list x x) x))
