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
;part a
(define variable? symbol?)
(define (same-variable? a b)
  (and
    (variable? a)
    (variable? b)
    (eq? a b)))

(define (make-sum v w)
  (cond ((=number? v 0) w)
        ((=number? w 0) v)
        ((and (number? v)
              (number? w)) (+ v w))
        (else (list v '+ w))))
(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))
(define addend car)
(define augend caddr)

(define (make-product v w)
  (cond ((=number? v 0) 0)
        ((=number? v 1) w)
        ((=number? w 0) 0)
        ((=number? w 1) v)
        ((and (number? v)
              (number? w)) (* v w))
        (else (list v '* w))))
(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))
(define multiplier car)
(define multiplicand caddr)

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

(deriv '(x + (3 * (x + (y + 2)))) 'x)

;part b
;+ has the least precedence so really it will act to grab lazily
;reduce the list if it has only one element
(define (augend expr)
  (if (null? (cdddr expr))
    (caddr expr)
    (cddr expr)))
;as operation order is LTR, we needn't modify addend, multiplier
;* has the most precedence so it will act greedy and grab the first
;which is usual procedure

(deriv '(x + 3 * (x + y + 2)) 'x)
(deriv '(x + 3 * (x + y + 2) + 6) 'x)
