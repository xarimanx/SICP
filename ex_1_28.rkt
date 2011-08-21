#lang racket
(define (square x)
  (* x x))

(define (apply-trivial-check k m r)
  (if (and (not (= k 1))
           (not (= k (- m 1)))
           (= r 1))
      0
      r))

(define (remainder-or-trivial k m)
  (apply-trivial-check k m (remainder (square k) m)))

(define (modified-expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder-or-trivial (modified-expmod base (/ exp 2) m) m))
        (else
         (remainder (* base (modified-expmod base (- exp 1) m))
                    m))))

(define (miller-rabin-test n)
  (define (miller-rabin-iteration a t n)
    (define (try-it a)
      (= (modified-expmod a (- n 1) n) 1))
    (if (= a n)
        (> t (/ n 2))
        (if (try-it a)
            (miller-rabin-iteration (+ a 1) (+ t 1) n)
            (miller-rabin-iteration (+ a 1) t n))))
  (miller-rabin-iteration 1 0 n))

(miller-rabin-test 561)
(miller-rabin-test 1105)
(miller-rabin-test 1729)
(miller-rabin-test 2465)
(miller-rabin-test 2821)
(miller-rabin-test 6601)