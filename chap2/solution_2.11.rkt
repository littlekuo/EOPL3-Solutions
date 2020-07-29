#lang racket

(define empty-env
  (lambda () '()))


(define extend-env*
  (lambda (vars vals env)
    (cond
      ((null? vars) env)
      (else (cons (cons vars vals) env)))))


(define extend-env
  (lambda (var val env)
    (extend-env* (list var) (list val) env)))



(define report-no-binding-found
  (lambda (lookup-var)
    (error 'apply-env "No binding for: " lookup-var)))

(define report-invalid-env
  (lambda (env)
    (error 'apply-env "Bad environment ~s" env)))



(define apply-env
  (lambda (env lookup-var)
    (cond
      ((null? env) (report-no-binding-found lookup-var))
      ;;decides whether it is a valid env
      ((and (pair? env) (pair? (car env)) (list? (caar env)) (list? (cdar env))) 
            (let ((val (apply-current (caar env) (cdar env) lookup-var)))
              (if (car val) (cdr val)
                  (apply-env (cdr env) lookup-var))))
      (else (report-invalid-env env)))))
    

(define apply-current
  (lambda (vars vals lookup-var)
    (if (null? vars)
	(cons #f '())
	(if (eqv? (car vars) lookup-var)
	    (cons #t (car vals))
	    (apply-current (cdr vars) (cdr vals) lookup-var)))))


(define menv
 (extend-env 't 102
  (extend-env* '(a b c) '(11 12 13)
               (extend-env* '(x z) '(66 67)
                            (extend-env* '(x y) '(88 89) (empty-env))))))