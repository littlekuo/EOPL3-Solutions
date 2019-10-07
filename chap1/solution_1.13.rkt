#lang eopl


;solution to 1.13
(define subst2
  (lambda (new old ls)
    (if (null? ls) '()
     (map (lambda (x) (if (symbol? x)
                          (if (eqv? x old) new x)
                          (subst2 new old x))) ls))))