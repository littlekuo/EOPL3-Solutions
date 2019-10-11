#lang racket

(require "solution_1.31.rkt")

;solution to 1.32
(define double-tree
  (lambda (bintree)
    (if (leaf? bintree)
        (* 2 bintree)
        (interior-node (car bintree) (double-tree (lson bintree)) (double-tree (rson bintree))))))