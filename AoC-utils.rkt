#lang r7rs
(define-library (AoC-utils)
  (export srtring-split make-matrix matrix-ref matrix-set!)
  (import (scheme base))
  (begin

    (define (string-split str delimiter)
      (let loop ((s str) (parts '()))
        (let ((pos (string-index s (string-ref delimiter 0)))) ; Find the first delimiter
          (if pos
              (loop (substring s (+ pos 1)) 
                    (append parts (list (substring s 0 pos))))
              (append parts (list s)))))) ; Add the last piece

    (define (make-matrix string)
      (let* ((lst (string-split string "\n"))
             (x (length lst))
             (y (string-length (car lst)))
             (v (make-vector x 0)))
        (let loop
          ((i 0)
           (list lst))
          (if (= i x)
              v
              (begin
                (vector-set! v i (string->vector (car list)))
                (loop (+ i 1) (cdr list)))))))

    (define (matrix-ref matrix x y)
      (vector-ref (vector-ref matrix x) y))

    (define (matrix-set! matrix x y in)
      (vector-set! (vector-ref matrix x) y in))
    ))