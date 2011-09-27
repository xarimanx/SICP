#lang racket
(define (product-rec term a next b)
    (if (> a b)
        1
        (* (term a) (product-rec term (next a) next b))))

(define (id x) x)
(define (inc n) (+ 1 n))

(define (factorial n)
  (product-rec id 1 inc n))

(define (pi-product n)
  (define (pi-term k)
    (/ (* (- k 1) (+ k 1))
       (* k k)))
  (define (inc2 k) (+ k 2))
  (* 4.0
     (product-rec pi-term 3 inc2 n)))

(factorial 3)
(pi-product 10000)