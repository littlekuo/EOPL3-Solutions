#lang eopl


(define-datatype bintree bintree?
  (leaf-node
    (num integer?))
  (interior-node
    (key symbol?)
    (left bintree?)
    (right bintree?)))

(define max-interior
  (lambda (tree)
    (cadr (max-interior-helper tree))))

(define replace-with-interior-key
  (lambda (key ret)
    (if (null? (cadr ret))
        (list (car ret) key)
        ret)))

(define max-interior-helper
  (lambda (tree)
    (cases bintree tree
      (leaf-node (num) (list num '()))
      (interior-node
        (key l r)
        (let ((l-ret (replace-with-interior-key key (max-interior-helper l)))
              (r-ret (replace-with-interior-key key (max-interior-helper r))))
             (let
                ((l-val (car l-ret))
                 (r-val (car r-ret)))
                    (let
                      ((sub-tree-max
                        (if (< l-val r-val) r-ret l-ret)))
                       (if (< (car sub-tree-max) (+ l-val r-val))
                           (list (+ l-val r-val) key)
                           sub-tree-max))))))))