#lang eopl

;solution to 1.27
(define flatten
  (lambda (slist)
    (cond
      ((null? slist) '())
      ((symbol? (car slist))(cons (car slist) (flatten (cdr slist))))
      (else (append (flatten (car slist)) (flatten (cdr slist)))))))
