#lang eopl

;solution to 1.19
(define list-set
  (lambda (lst n x)
    (cond
      ((eqv? n 0)(cons x (cdr lst)))
      (else (cons (car lst) (list-set (cdr lst) (- n 1) x))))))


