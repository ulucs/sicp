(define x '(1 2 3))
(define y '(4 5 6))

;expected (1 2 3 4 5 6)
(append x y)

;expected ((1 2 3) 4 5 6)
(cons x y)

;expected ((1 2 3) (4 5 6))
(list x y)
