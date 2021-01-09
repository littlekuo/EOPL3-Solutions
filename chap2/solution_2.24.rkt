#lang eopl


(define-datatype bintree bintree?
  (leaf-node
   (num integer?))
  (interior-node
   (key symbol?)
   (left bintree?)
   (right bintree?)))


(define bintree-to-list
  (lambda (bt)
    (cases bintree bt
      (leaf-node (n) (list 'leaf-node n))
      (interior-node (key left right)
                     (list 'interior-node
                           key
                           (bintree-to-list left)
                           (bintree-to-list right))))))