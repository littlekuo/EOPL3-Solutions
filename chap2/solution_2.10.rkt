#lang racket


(define empty-env
  (lambda () '()))


(define extend-env
  (lambda (var val env)
    (cons (cons var val) env)))

(define apply-env
  (lambda (env search-var)
    (cond
     ((null? env)
      (report-no-binding-found search-var))
     ((eqv? (caar env) search-var)
      (cdr (car env)))
     (else
      (apply-env (cdr env) search-var)))))


(define report-no-binding-found
  (lambda (search-var)
    (error 'apply-env "No binding for: " search-var)))



(define has-binding?
  (lambda (env var)
    (cond
     ((null? env) #f)
     ((eqv? (caar env) var) #t)
     (else
      (has-binding? (cdr env) var)))))

;add
(define extend-env*
  (lambda (vars vals env)
    (cond
      ((null? vars) env)
      (else (extend-env* (cdr vars) (cdr vals) (extend-env (car vars) (car vals) env))))))



(define e
  (extend-env 'd 6
     (extend-env 'y 8
        (extend-env 'x 7
           (extend-env 'y 14
              (empty-env))))))

(extend-env* '(A) '(1) e)
(extend-env* '(A B C) '(1 2 3) e)
