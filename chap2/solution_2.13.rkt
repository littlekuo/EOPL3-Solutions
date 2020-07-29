#lang racket



(define report-no-binding-found
  (lambda (search-var)
    (error 'apply-env "No binding for: " search-var)))


(define empty-env
  (lambda ()
    (list
     (lambda (search-var)
      (report-no-binding-found search-var))
     (lambda ()
       #t))))

(define extend-env
  (lambda (saved-var saved-val saved-env)
    (list
     (lambda (search-var)
      (if (eqv? search-var saved-var)
          saved-val
          (apply-env saved-env search-var)))
     (lambda ()
       #f))))


(define apply-env
  (lambda (env search-var)
    ((car env) search-var)))

(define empty-env?
  (lambda (env)
    ((cadr env))))

(define e
  (extend-env 'd 6
     (extend-env 'y 8
        (extend-env 'x 7
           (extend-env 'y 14
              (empty-env))))))


;test
(equal? (apply-env e 'y) 8)
(equal? (apply-env e 'x) 7)
(equal? (empty-env? (empty-env)) #t)
(equal? (empty-env? e) #f)

