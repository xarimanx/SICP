#lang racket
(define (accumulate-rec combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-rec combiner null-value term (next a) next b))))

(define (inc n) (+ n 1))

(define (sum-acc term a next b)
  (accumulate-iter + 0 term a next b))

(define (product-acc term a next b)
  (accumulate-iter * 1 term a next b))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combiner result (term a)))))
  (iter a null-value))


(define (factorial n)
  (product-acc * 1 inc n))

(factorial 5);120

(define (sum n)
  (sum-acc + 0 inc n))

(sum 5);15