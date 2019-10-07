#lang eopl

;solution to 1.21
;method1
(define product
  (lambda (sos1 sos2)
    (cond
      ((null? sos1) '())
      ((null? sos2) '())
      (else (append (cons (list (car sos1) (car sos2)) (product (list (car sos1)) (cdr sos2)))
                    (product (cdr sos1) sos2))))))

