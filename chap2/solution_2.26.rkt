#lang eopl

(define-datatype red-blue-tree red-blue-tree?
  (a-red-blue-tree
   (root red-blue-subtree?)))


(define-datatype red-blue-subtree red-blue-subtree?
  (red-node
   (left red-blue-subtree?)
   (right red-blue-subtree?))
  (blue-node
   (subtrees (list-of red-blue-subtree?)))
  (leaf-node
   (num integer?)))


(define helper
  (lambda (b red-depth)
    (cases red-blue-subtree b
      (red-node (left right)
                  (red-node (helper left (+ red-depth 1)) (helper right (+ red-depth 1))))
      (blue-node (subtrees)
                  (blue-node (map (lambda (s) (helper s red-depth)) subtrees)))
      (leaf-node (num) (leaf-node red-depth)))))


(define mark-leaves-with-red-depth
  (lambda (b)
    (cases red-blue-tree b
        (a-red-blue-tree (root) (helper root 0)))))



;test
(define input-tree
 (a-red-blue-tree
  (red-node
    (blue-node (list (leaf-node 26) (leaf-node 12)))
    (red-node
      (leaf-node 11)
      (blue-node (list (leaf-node 117) (leaf-node 14)))))))

(define expected-tree
 (a-red-blue-tree
  (red-node
    (blue-node (list (leaf-node 1) (leaf-node 1)))
    (red-node (leaf-node 2) (blue-node (list (leaf-node 2) (leaf-node 2)))))))
