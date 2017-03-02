(define (cont-frac n d k)
  (define (f-iter i)
    (if (= i k)
      (/ (n i) (d i))
      (/ (n i) (+ (d i) (f-iter (+ i 1))))))
  (f-iter 1))
(define (fi k)
  (/ 1.0
     (cont-frac (lambda (i) 1.0)
                (lambda (i) 1.0)
                k)))
