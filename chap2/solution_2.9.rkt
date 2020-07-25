#lang racket


(define has-binding?
  (lambda (env var)
    (cond
     ((null? env) #f)
     ((eqv? (caar env) var) #t)
     (else
      (has-binding? (cdr env) var)))))