#lang racket


;procedural representation.

(define empty-stack
  (lambda ()
    (lambda (instruction)
      (cond ((eqv? instruction 'empty?) #t)))))

(define empty-stack?
  (lambda (stack)
    (stack 'empty?)))

(define push
  (lambda (stack val)
    (lambda (instruction)
      (cond ((eqv? instruction 'empty?) #f)
            ((eqv? instruction 'pop) stack)
            ((eqv? instruction 'top) val)))))

(define pop
  (lambda (stack)
    (stack 'pop)))

(define top
  (lambda (stack)
    (stack 'top)))



(define e (empty-stack))
(define x1 (push e 1))
(define x2 (push x1 2))
(define x3 (push x2 3))

(empty-stack? e)
(empty-stack? x1)
(empty-stack? (pop x1))
(top x2)
