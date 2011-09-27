#lang racket

(define (inc n) (+ 1 n))
(define (square n)(* n n))
(define (repeated f n)
        (define (rep-iter g count)
                (if (= count 1) g (rep-iter (compose f g) (- count 1))))
  
        (rep-iter f n))

(define (smooth f)
  (define dx .00001)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3.0)))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

((n-fold-smooth square 1) 1)