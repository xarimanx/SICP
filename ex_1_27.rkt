#lang racket
(define (square n) (* n n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)  
        ((even? exp)
          (remainder (square (expmod base (/ exp 2) m)) m))
        (else
          (remainder (* base (expmod base (- exp 1) m)) m))))

(define (carmichael? n)
  (define (carm? n a)
    (cond ((= a 0) #t)
          ((= (expmod a n n) a) (carm? n (- a 1)))
          (else #f)))
  (carm? n (- n 1)))

(carmichael? 1105)