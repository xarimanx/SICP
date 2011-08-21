#lang racket
(define (pascal m n)
  (cond
    ((> m n) 'error) ;; return error symbol, incorrect input data
    ((= 0 m) 1)
    ((= m n) 1)
    (else (+ 
           (pascal (- m 1) (- n 1))
           (pascal m (- n 1))))))

(pascal 3 6)

x 0 1 2 3 4 5
0 1 1 1 1 1 1
1 x 1 2 3 4 5
1 x x 1 3 6 10
2 x x x 1 4 10
3 x x x x 1 5
4 x x x x x 1
5 x