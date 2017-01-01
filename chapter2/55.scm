;it will be clearer if we expand the quotes
(car (quote (quote abracadabra)))

;because of the first quote, (quote abracadabra) is
;interpreted as a symbolic list instead of an expression
;which is wht car returns quote
