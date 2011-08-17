#lang racket
(define (max-square-sum x y z)
  (define f (if (> x y) x y))
  (define s (if (< x y) x y))
  (define t (if (> s z) s z))
  (+ (* f f) (* t t)))