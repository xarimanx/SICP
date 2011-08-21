#lang racket
(define phi  
  (/ (+ 1 (sqrt 5))
     2))

(define psi  
  (/ (- 1 (sqrt 5))
     2))

(define (fib n)
  (/ (- (expt phi n) (expt psi n))
     (sqrt 5)))

(define (fibi n)
  (fib-iterativ 1 0 n)
  )

(define (fib-iterativ f s count)
  (if (= count 0) s
      (fib-iterativ (+ f s) f (- count 1))
      ))


(fibi 10)
(fib 10)