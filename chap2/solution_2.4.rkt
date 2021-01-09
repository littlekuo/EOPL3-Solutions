#lang racket


(define empty-stack
  (lambda ()
    '()))

(define empty-stack?
  (lambda (s)
    (if (equal? s '()) #t
	#f)))

(define push
  (lambda (s val)
    (cons val s)))

(define pop
  (lambda (s)
    (cdr s)))

(define top
  (lambda (s)
    (car s)))