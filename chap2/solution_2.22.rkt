#lang eopl

(define-datatype stack stack?
  (empty-stack)
  (push
   (val value?)
   (saved-stack stack?)))



(define value? (lambda (v) #t))


(define pop
  (lambda (st)
    (cases stack st
      (empty-stack ()
                   (eopl:error "pop" "Empty stack"))
      (push (val saved-stack) saved-stack))))


(define top
  (lambda (st)
    (cases stack st
      (empty-stack ()
                   (eopl:error "top" "Empty stack"))
      (push (val saved-stack) val))))


(define empty-stack?
  (lambda (st)
    (cases stack st
      (empty-stack () #t)
      (push (val saved-stack) #f))))