#lang racket

(define (cube n) (* n n n))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc1 n) (+ n 1))
(define (inc2 n) (+ n 2))

(define (simpson f a b n)
  (let* ((h (/ (- b a) n))
         (term (lambda(k) (f (+ a (* k h))))))
    (* (/ h 3.0)
       (+ (sum term 0 inc1 n)
          (sum term 1 inc1 (- n 1))
          (* 2.0 (sum term 1 inc2 (- n 1)))))))

(simpson cube 0 1 100)
(simpson cube 0 1 1000)