#lang racket
(define (square x) (* x x))

(define (max-square-sum x y z)
  (define f (if (> x y) x y))
  (define s (if (< x y) x y))
  (define t (if (> s z) s z))
  (+ (square f) (square t)))

(define (squares-sum x y) (+ (square x) (square y)))
(define (max-square-sum2 x y z)
          (cond
            ((and (< x y) (< x z)) (squares-sum y z))
            ((and (< y x) (< y z)) (squares-sum x z))
            (else (squares-sum x y))))

(max-square-sum 3 2 4)
(max-square-sum2 3 2 4)
