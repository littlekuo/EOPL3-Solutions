#lang eopl


;solution to 1.18
(define swapper
  (lambda (s1 s2 slist)
    (cond ((null? slist) '())
          ((symbol? (car slist))
           (cond
             ((eqv? (car slist) s1) (cons s2 (swapper s1 s2 (cdr slist))))
             ((eqv? (car slist) s2) (cons s1 (swapper s1 s2 (cdr slist))))
             (else (cons (car slist) (swapper s1 s2 (cdr slist))))))
          (else (cons (swapper s1 s2 (car slist)) (swapper s1 s2 (cdr slist)))))))
             
    