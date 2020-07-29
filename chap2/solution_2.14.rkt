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
       #t)
     ;;add
     (lambda (search-var)
       #f)
     )))

(define extend-env
  (lambda (saved-var saved-val saved-env)
    (list
     (lambda (search-var)
      (if (eqv? search-var saved-var)
          saved-val
          (apply-env saved-env search-var)))
     (lambda ()
       #f)
     ;;add
     (lambda (search-var)
       (if (eqv? search-var saved-var) #t
           (has-binding? saved-env search-var)))
     )))


(define apply-env
  (lambda (env search-var)
    ((car env) search-var)))

(define empty-env?
  (lambda (env)
    ((cadr env))))

;;add
(define has-binding?
  (lambda (env var)
    ((caddr env) var)))

(define e
  (extend-env 'd 6
     (extend-env 'y 8
        (extend-env 'x 7
           (extend-env 'y 14
              (empty-env))))))


;test
(equal? (has-binding? e 'd) #t)
(equal? (has-binding? e 's) #f)
(equal? (has-binding? e 'x) #t)
(equal? (has-binding? e 'y) #t)
(equal? (has-binding? e 'm) #f)


