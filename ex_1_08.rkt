#lang racket
(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (good-enough? guess x)
  (< (abs (/ (- (cube guess) x) x)) 0.001))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (cube-root guess x)
  (if (good-enough? guess x)
      guess
      (cube-root (improve guess x)
                 x)))

(cube-root 3 27)