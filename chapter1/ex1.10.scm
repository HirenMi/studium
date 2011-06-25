#!/usr/local/bin/guile -s
!#

;; Exercise 1.10. The following procedure computes a mathematical function called Ackermann's function.

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

;; What are the values of the following expressions?


(A 1 10)
; (A 0 (A 1 9))
; (A 0 (A 0 (A 1 8)))
; ...
; (A 0 (A 0 (A 0 ... (A 1 2))))
; (A 0 (A 0 (A 0 ... (A 0 (A 1 1)))))
; (A 0 (A 0 (A 0 ... (A 0 2))))
; (A 0 (A 0 (A 0 ... 4)))
; ...
; (A 0 (A 0 256))
; (A 0 512)
; 1024
; 2^10

(A 2 4)
; (A 1 (A 2 3))
; (A 1 (A 1 (A 2 2)))
; (A 1 (A 1 (A 1 (A 2 1))))
; (A 1 (A 1 (A 1 2)))
; (A 1 (A 1 (A 0 (A 1 1))))
; (A 1 (A 1 (A 0 2)))
; (A 1 (A 1 4))
; (A 1 (A 0 (A 1 3)))
; (A 1 (A 0 (A 0 (A 1 2))))
; (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
; (A 1 (A 0 (A 0 (A 0 2))))
; (A 1 (A 0 (A 0 4)))
; (A 1 (A 0 8))
; (A 1 16)
; from previous (A 1 16) simplifies to 2^16
; 65536

(A 3 3)
; (A 2 (A 3 2))
; (A 2 (A 2 (A 3 1)))
; (A 2 (A 2 2))
; from previous (A 2 2) simplifies to 4
; (A 2 4) which is same as previous excersize
; 65536


;; Consider the following procedures, where A is the procedure defined above:

(define (f n) (A 0 n))

(define (g n) (A 1 n))

(define (h n) (A 2 n))

(define (k n) (* 5 n n))

;; Give concise mathematical definitions for the functions computed by the procedures f, g, and h
;; for positive integer values of n. For example, (k n) computes 5n2. 


; (f n) computes 2n
; (g n) computes 2^n
; (h n) computes 2^(2^(2^..2)) n times

