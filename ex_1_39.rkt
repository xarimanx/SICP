#lang racket

(define (cont-frac n d k)
  (define (iter sum k)
    (if (= k 0)
        sum
        (iter (/ (n k)
                 (+ (d k) sum))
              (- k 1))))
  (iter 0 k))

(define (dec n) (- n 1))

(define (tan-cf x k)
  
  (define (n i)
    (if (= i 1)
        x
        (- (* x x))))
  
  (define (d i)
    (dec (* i 2.0)))
  
  (cont-frac n d k))

(define (mytan n) (tan-cf n 20))

(tan 10)
(mytan 10)