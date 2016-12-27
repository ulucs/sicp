(define (same-parity . not-list)
  (define (same-parity-rec items)
    (if (null? items)
      items
      (if (parity (car items))
        (cons (car items)
              (same-parity-rec (cdr items)))
        (same-parity-rec (cdr items)))))

  (define parity
    (if (even? (car not-list))
      even?
      odd?))

  (same-parity-rec not-list))

(define (support-arb-args-as-list f)
  (lambda w (f w)))

(same-parity 1 2 3 4 4 5 6 7 8)
(same-parity 2 3 4 5 6 7)

((support-arb-args-as-list cdr) 1 2 3 4 5)
