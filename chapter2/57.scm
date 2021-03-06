;here comes the derivative
(define (deriv expr var)
  (cond ((number? expr) 0)
        ((variable? expr)
         (if (same-variable? expr var)
           1 0))
        ((sum? expr)
         (make-sum (deriv (addend expr) var)
                   (deriv (augend expr) var)))
        ((product? expr)
         (make-sum
           (make-product (multiplier expr)
                         (deriv (multiplicand expr) var))
           (make-product (deriv (multiplier expr) var)
                         (multiplicand expr))))
        ((power? expr)
           (make-product
             (make-product (pow expr)
                           (make-power (base expr)
                                       (- (pow expr) 1)))
             (deriv (base expr) var)))
        (else
          (error "unknown expression type -- DERIV" expr))))

;yes, this does not exist
(define (=number? a b)
  (and (number? a)
       (eq? a b)))

;and the helper functions
(define variable? symbol?)
(define (same-variable? a b)
  (and
    (variable? a)
    (variable? b)
    (eq? a b)))

(define (make-sum v . w)
  (if (null? w) v
    (let ((sum (cons '+ (cons v w))))
      (cond ((=number? v 0) (apply make-sum w))
            ((=number? (car w) 0) v)
            ((and (number? v)
                  (number? w)) (+ v w))
            (else sum)))))
(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
(define addend cadr)
(define (augend expr)
  (if (null? (cdddr expr))
    (caddr expr)
    (apply make-product (cddr expr))))

(define (make-product v . w)
  (if (null? w) v
    (let ((product (cons '* (cons v w))))
      (cond ((=number? (car w) 0) 0)
            ((=number? v 1) (apply make-product w))
            ((=number? v 0) 0)
            ((=number? (car w) 1) v)
            ((and (number? v)
                  (number? w)) (* v w))
            (else product)))))
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
(define multiplier cadr)
(define (multiplicand expr)
  (if (null? (cdddr expr))
    (caddr expr)
    (apply make-product (cddr expr))))

(define (make-power x n)
  (cond ((=number? 0 n) 1)
        ((=number? 0 x) 0)
        ((=number? 1 n) x)
        ((=number? 1 x) 1)
        ((and (number? x)
              (number? n)) (expt x n))
        (else (list '** x n))))
(define (power? expr)
  (and (pair? expr) (eq? (car expr) '**)))
(define pow caddr)
(define base cadr)

(deriv '(* x y (+ x 3)) 'x)
