#lang racket

(define tolerance 0.00001)
(define dx        0.00001)


(define (fixed-point f first-guess)
  
        (define (close? v1 v2) (< (abs (- v1 v2)) 0.0001))
  
        (define (try guess step)
                (let ((next (f guess)))
                        (display step) (display ":\t") (display guess) (newline)
                        (if (close? guess next) next (try next (+ step 1)))))
  
        (try first-guess 1))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx))
          (g x))
       dx)))

(define (square x)
  (* x x))

(define (newton-transform g)
  (lambda (x)
    (- x 
       (/ (g x)((deriv g) x)))
    ))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (lambda (x)
    (+  (* x x x)
        (* a x x)
        (* b x)
        c)))

(newtons-method (cubic 1 2 3) 1.0) ; step - 6
