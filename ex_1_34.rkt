#lang racket
(define (f g)
  (g 2))
(define (square n) (* n n))
 

(f square)
(f (lambda (z) (* z (+ z 1))))
(f f) ;procedure application: expected procedure, given: 2; arguments were: 2
; неизвестно, что делать с (2 2)