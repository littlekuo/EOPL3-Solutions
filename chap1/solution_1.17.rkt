#lang eopl


;solution to 1.17
(define down
  (lambda (lst)
    (if (null? lst)
        '()
        (cons
         (list (car lst))
         (down (cdr lst))))))