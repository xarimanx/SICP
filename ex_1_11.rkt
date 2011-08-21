#lang racket
(define (f-rec n)
  (if (< n 3)
      n
      (+ 
       (f-rec (- n 1))
       (f-rec (- n 2))
       (f-rec (- n 3)))))

(define (f-iter n)
  (define (f-inner a b c k)
    (if (< k 3)
        c 
        (f-inner
         b  ; a <- b
         c  ; b <- c
         (+ a b c) ; c 
         (- k 1)))) ; decrement counter
  (if (< n 3)
      n
      (f-inner 0 1 2 n)))



(f-rec 4)
(f-iter 4)