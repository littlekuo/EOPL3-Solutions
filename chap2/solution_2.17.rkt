#lang racket

;a)use a list with a tag as the first element:

(define var-exp-1
  (lambda (var) (list 'var var)))

(define lambda-exp-1
  (lambda (var body) (list 'lambda var body)))

(define app-exp-1
  (lambda (exp1 exp2) (list 'app exp1 exp2)))

(define var-exp-1?
  (lambda (exp) (and (pair? exp) (eqv? 'var (car exp)))))

(define lambda-exp-1?
  (lambda (exp) (and (pair? exp) (eqv? 'lambda (car exp)))))

(define app-exp-1?
  (lambda (exp) (and (pair? exp) (eqv? 'app (car exp)))))

(define var-exp->var-1 cadr)
(define lambda-exp->bound-var-1 cadr)
(define lambda-exp->body-1 caddr)
(define app-exp->rator-1 cadr)
(define app-exp->rand-1 caddr)


;b)




