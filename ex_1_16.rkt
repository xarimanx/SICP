#lang racket
(define (fast-exp-iter b n)
  (define (exp b n a)
    (cond ((= n 0) a)
          ((even? n) (exp (* b b) (/ n 2) a))
          (else (exp b (- n 1) (* b a)))))
  (exp b n 1))

(fast-exp-iter 2 10)