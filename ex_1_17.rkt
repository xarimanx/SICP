#lang racket
(define (double x) (+ x x))
(define (halve x) (/ x 2))


(define (mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (mult a (halve b))))
        (else      (+ a (mult a (- b 1))))))

(mult 2 10)