#lang eopl

;Solution to 1.9
(define remove-all
  (lambda (s los)
    (if (null? los)'()
        (if (eqv? (car los) s)
            (remove-all s (cdr los))
            (cons (car los) (remove-all s (cdr los)))))))