(define (queens board-size)
  (define (queen-cols k)
    (if (eq? k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (other-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k other-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (enumerate-interval low high)
  (if (> low high)
    '()
    (cons low
          (enumerate-interval (+ low 1)
                              high))))
(define (flatmap f items)
  (fold-left
    append '()
    (map f items)))

;let's just get this working with no functionality
(define empty-board '())
(define (safe? k positions)
  #t)
(define (adjoin-position new-row k other-of-queens)
  (cons (list new-row k)
        other-of-queens))

;this only leaves safe to be done so here it is
(define (safe? k positions)
  (and
    ;case 1.5? : equal row number?
    (andmap (lambda (x)
              (not (eq? (car (car positions))
                        (car x))))
            (cdr positions))
    ;case 2 : add diagonal check
    (andmap (lambda (x)
              (not (eq? (+ (car (car positions)) (cadr (car positions)))
                        (+ (car x) (cadr x)))))
            (cdr positions))
    ;case 3 : substract diagonal check
    (andmap (lambda (x)
              (not (eq? (- (car (car positions)) (cadr (car positions)))
                        (- (car x) (cadr x)))))
            (cdr positions))))
;oh hey andmap is not defined too
(define (andmap f items)
  (if (null? items)
    #t
    (and (f (car items))
         (andmap f (cdr items)))))

(queens 8)
