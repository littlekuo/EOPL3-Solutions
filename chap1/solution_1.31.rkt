#lang racket


(provide leaf? interior-node leaf lson rson contents-of)

;solution to 1.31
(define (leaf n) n)

(define interior-node
  (lambda (s left right)
    (list s left right)))

(define leaf?
  (lambda (bintree)
    (not (pair? bintree))))

;
(define lson cadr)

(define rson caddr)


(define contents-of
  (lambda (bintree)
    (if (leaf? bintree) bintree (car bintree))))




