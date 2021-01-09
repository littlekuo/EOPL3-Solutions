#lang racket



(define number->bintree
  (lambda (n)
    (list n '() '())))

(define at-leaf? null?)


(define current-element car)

(define move-to-left cadr)

(define move-to-right caddr)


(define insert-to-left
  (lambda (n tree)
    (list (current-element tree)
          (list n (move-to-left tree) '())
          (move-to-right tree))))


(define insert-to-right
  (lambda (n tree)
    (list (current-element tree)
          (move-to-left tree)
          (list n '() (move-to-right tree)))))