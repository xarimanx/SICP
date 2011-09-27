#lang racket
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter
         (next a)
         (* result (term a)))))
  (iter a 1))

(define (id x) x)
(define (inc n) (+ 1 n))

(define (factorial n)
  (product-iter id 1 inc n))

(define (pi-product n)
  (define (pi-term k)
    (/ (* (- k 1) (+ k 1))
       (* k k)))
  (define (inc2 k) (+ k 2))
  (* 4.0
     (product-iter pi-term 3 inc2 n)))

(factorial 3)
(pi-product 10000)