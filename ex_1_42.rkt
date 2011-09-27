#lang racket

(define (inc n) (+ 1 n))
(define (square n)(* n n))
(define (compose f g)
  (lambda (x) (f (g x))))

((compose square inc) 6); (6+1)^2=49