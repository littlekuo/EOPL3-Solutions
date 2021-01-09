#lang racket


(define var-exp (lambda (var) var))

(define lambda-exp
  (lambda (var body)
    (list 'lambda var body)))

(define app-exp
  (lambda (exp1 exp2)
    (list exp1 exp2)))

(define var-exp? symbol?)

(define lambda-exp?
  (lambda (exp)
    (and (pair? exp) (eqv? 'lambda (car exp)))))

(define app-exp?
  (lambda (exp)
    (and (pair? exp) (pair? (cdr exp) (null? (cddr exp))))))

(define var-exp->var (lambda (exp) exp))

(define lambda-exp->bound-var cadr)

(define lambda-exp->body caddr)

(define app-exp->rator car)

(define app-exp->rand cadr)

;test
 (define occurs-free?
  (lambda (search-var exp)
    (cond
     ((var-exp? exp) (eqv? search-var (var-exp->var exp)))
     ((lambda-exp? exp)
      (and
       (not (eqv? search-var (lambda-exp->bound-var exp)))
       (occurs-free? search-var (lambda-exp->body exp))))
     (else
      (or
       (occurs-free? search-var (app-exp->rator exp))
       (occurs-free? search-var (app-exp->rand exp)))))))

(equal?
 (occurs-free? 'x (lambda-exp 'x (app-exp (var-exp 'y) (var-exp 'x))))
 #f)

(equal?
 (occurs-free? 'y (lambda-exp 'x (app-exp (var-exp 'y) (var-exp 'x))))
 #t)