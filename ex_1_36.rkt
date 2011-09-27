#lang racket

(define (fixed-point f first-guess)
  
        (define (close? v1 v2) (< (abs (- v1 v2)) 0.0001))
  
        (define (try guess step)
                (let ((next (f guess)))
                        (display step) (display ":\t") (display guess) (newline)
                        (if (close? guess next) next (try next (+ step 1)))))
  
        (try first-guess 1))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.); Ends in 29 steps.
(fixed-point (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2)) 2.); Ends in 8 steps.