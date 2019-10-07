#lang eopl

;solution to 1.24
(define every?
  (lambda (pred lst)
    (cond
      ((null? lst) #t)
      ((not (pred (car lst))) #f)
      (else (every? pred (cdr lst))))))