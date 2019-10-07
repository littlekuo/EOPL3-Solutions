#lang eopl


;solution to 1.16
(define invert-two
  (lambda (ls)
    (if (null? ls)
        '()
        (cons (car (cdr ls)) (list (car ls))))))

(define invert
  (lambda (lst)
    (if (null? lst)
        '()
        (cons (invert-two (car lst))
         (invert (cdr lst))))))
