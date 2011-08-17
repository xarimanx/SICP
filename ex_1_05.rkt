#lang racket
;With applicative order - there will be an infinite evaluation in procedure p.
;With normal order - procedure test will return zero.

(define (p) (p))

(define (test x y)
  
(if (= x 0)
    0
    y))

(test 0 (p))