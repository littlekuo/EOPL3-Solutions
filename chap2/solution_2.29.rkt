#lang eopl

(define-datatype lc-exp lc-exp?
  (var-exp
   (var identifier?))
  (lambda-exp
   (bound-var (list-of identifier?))
   (body lc-exp?))
  (app-exp
   (rator lc-exp?)
   (rands (list-of lc-exp?))))


(define identifier?
  (lambda (x)
    (and (symbol? x) (not (eqv? 'lambda x)))))


;parse
(define parse-expression
  (lambda (datum)
    (cond
      ((symbol? datum) (var-exp datum))
      ((pair? datum)
       (if (eqv? (car datum) 'lambda)
           (lambda-exp
            (cadr datum)
            (parse-expression (caddr datum)))
           (app-exp
            (parse-expression (car datum))
            (map parse-expression (cdr datum)))))
      (else (report-invalid-concrete-syntax datum)))))


(define report-invalid-concrete-syntax
  (lambda (datum)
    (eopl:error 'parse-expression "Syntax error: ~s" datum)))

