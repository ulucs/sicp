;remember some previous functions
;to be our helper methods
(define (accumulate f i items)
  (if (null? items)
    i
    (f (car items)
       (accumulate f i (cdr items)))))
(accumulate + 0 '(1 2 3 4 5))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    '()
    (cons (accumulate op init (first-items seqs))
          (accumulate-n op init (later-items seqs)))))
(define (first-items seqs)
  (accumulate (lambda (x y)
                (cons (car x) y))
              '()
              seqs))
(define (later-items seqs)
  (accumulate (lambda (x y)
                (cons (cdr x) y))
              '()
              seqs))

;book shows this
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;code starts here
(define (matrix-*-vector A b)
  (map (lambda (x)
         (accumulate + 0
                     (map * x b)))
       A))
(matrix-*-vector '((0 0 3)
                   (0 2 0)
                   (3 0 0))
                 '(1 2 3))

(define (transpose M)
  (accumulate-n cons '() M))
(transpose '((1 2 3)
             (4 5 6)
             (7 8 9)))

(define (matrix-*-matrix A B)
  (let ((cols (transpose B)))
    (map (lambda (x)
           (map (lambda (y)
                  (dot-product x y))
                cols))
         A)))
(matrix-*-matrix '((1 0 0)
                   (0 0 2)
                   (0 3 0))
                 '((1 2 3)
                   (4 5 6)
                   (7 8 9)))
