#lang racket

(require "solution_1.31.rkt")
;solution to 1.35
;
(define number-leaves-from
  (lambda (btree n)
    (cond
      ((leaf? btree)(list n (+ n 1)))
      (else (let* ([lt (number-leaves-from (cadr btree) n)]
                   [rt (number-leaves-from (caddr btree) (cadr lt))])
                 (list (list (car btree) (car lt) (car rt)) (cadr rt)))))))
       

(define number-leaves
  (lambda (btree)
    (car (number-leaves-from btree 0))))