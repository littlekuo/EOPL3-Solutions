#lang racket


;solution to 1.34

(define path
  (lambda (n bst)
    (cond
      ((= n (car bst)) '())
      ((> (car bst) n) (cons 'left (path n (cadr bst))))
      (else (cons 'right (path n (caddr bst)))))))
         
  