#lang racket

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt-iter2 guess pre-guess x)
  (if (good-enough? guess pre-guess)
      guess
      (sqrt-iter2 (improve guess x)
                 guess x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess pre-guess)
  (< (abs (- guess pre-guess)) 0.01))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt2 x)
  (sqrt-iter2 1.0 0 x))


(sqrt 900)

(sqrt2 900)