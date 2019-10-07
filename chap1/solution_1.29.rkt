#lang racket


;solution to 1.29
;merge sort
(define sort
  (lambda (loi)
    (let ((n (length loi)))
      (cond
        ((null? loi) '())
        ((= (length loi) 1) loi)
        (else (merge (sort (firstHalf loi (quotient n 2))) (sort (lastHalf loi (quotient n 2)))))))))

(define merge
  (lambda (loi1 loi2)
    (cond
      ((null? loi1) loi2)
      ((null? loi2) loi1)
      ((< (car loi1) (car loi2)) (cons (car loi1) (merge (cdr loi1) loi2)))
      (else (cons (car loi2) (merge (cdr loi2) loi1))))))
  
(define (firstHalf loi n)
   (cond
     ((= n 0) '())
     (else (cons (car loi) (firstHalf (cdr loi) (- n 1))))))
  
  
(define (lastHalf loi n)
  (cond
    ((= n 0) loi)
    (else (lastHalf (cdr loi) (- n 1)))))
