#lang eopl

;solution to 1.12
(define subst1
  (lambda (new old ls)
    (if (null? ls) '()
        (cons
         (if (symbol? (car ls))
              (if (eqv? (car ls) old) new (car ls))
              (subst1 new old (car ls)))
         (subst1 new old (cdr ls))))))