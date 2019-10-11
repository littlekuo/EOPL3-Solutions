#lang racket


(define g
  (lambda (p ls)
    (cons p (map (lambda (x) (cons (+ (car x) 1) (cdr x))) ls))))

(define number-elements
  (lambda (lst)
    (if (null? lst) '()
        (g (list 0 (car lst)) (number-elements (cdr lst))))))