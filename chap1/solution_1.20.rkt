#lang eopl

;solution to 1.20

(define count-occurrences
  (lambda (s slist)
    (cond
      ((null? slist) 0)
      ((symbol? (car slist))
        (if(eqv? s (car slist))
           (+ 1 (count-occurrences s (cdr slist)))
           (count-occurrences s (cdr slist))))
      (else (+ (count-occurrences s (car slist)) (count-occurrences s (cdr slist)))))))
       