(define us-coins '(50 25 10 5 1))
(define uk-coins '(100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount
                 (except-first-denomination coin-values))
             (cc (- amount
                    (first-denomination coin-values))
                 coin-values)))))

(define except-first-denomination cdr)
(define first-denomination car)
(define (no-more? coin-values)
  (null?  coin-values))

(cc 100 us-coins)
(cc 100 (reverse us-coins))
(cc 100 uk-coins)

