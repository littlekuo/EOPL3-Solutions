#lang racket


(require "solution_1.31.rkt")

;solution to 1.33
(define mark-leaves
  (lambda (bintree n)
    (if (leaf? bintree)
        (leaf n)
        (if (eqv? 'red (car bintree))
            (interior-node 'red (mark-leaves (lson bintree) (+ n 1)) (mark-leaves (rson bintree) (+ n 1)))
            (interior-node (car bintree) (mark-leaves (lson bintree) n) (mark-leaves (rson bintree) n))))))

(define mark-leaves-with-red-depth
  (lambda (bintree)
    (mark-leaves bintree 0)))