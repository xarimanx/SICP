#lang racket
(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (good-enough? guess x)
  (< (abs (/ (- (cube guess) x)
             x))
     0.001))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (cube-root x) (sqrt-iter 1.0 x))

(cube-root 27)