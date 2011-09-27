#lang racket

(define (inc n) (+ 1 n))
(define (square n)(* n n))
(define (repeated f n)
        (define (rep-iter g count)
                (if (= count 1) g (rep-iter (compose f g) (- count 1))))
  
        (rep-iter f n))

((repeated square 3) 2); ((2^2)^2)^2=256