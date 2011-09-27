#lang racket

(define (cont-frac n d k)
  
  (define (iter sum k)
    (if (= k 0)
        sum
        (iter (/ (n k)
                 (+ (d k) sum))
              (- k 1))))
  
  (iter 0 k))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)

(/ 1 1.618)