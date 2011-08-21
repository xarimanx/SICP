#lang racket

(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (mult a b)
  (define (mul a b c)
    (cond ((= b 0) c)
          ((even? b) (mul (double a) (halve b) c))
          (else      (mul a (- b 1) (+ a c)))))
  (mul a b 0))

(mult 2 10)