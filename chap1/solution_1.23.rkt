#lang eopl

;solution to 1.23
(define list-index-from
  (lambda (pred lst n)
    (cond
      ((null? lst) #f)
      ((pred (car lst)) n)
      (else (list-index-from pred (cdr lst) (+ n 1))))))
       

(define list-index
  (lambda (pred lst)
    (list-index-from pred lst 0)))
