#lang racket

(define (cont-frac n d k)
  (define (iter sum k)
    (if (= k 0)
        sum
        (iter (/ (n k)
                 (+ (d k) sum))
              (- k 1))))
  (iter 0 k))

(define (inc n) (+ n 1))

(define (euler k)
  (define (d i)
    (if (= (modulo (inc i) 3) 0)
        (* (/ (inc i) 3) 2.0)
        1.0))
  (+ 2.0 (cont-frac (lambda (i) 1.0) d k)))

(euler 10000)