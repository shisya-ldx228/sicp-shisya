(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(define (cal_pi n)
  (define (term x)
    (if (odd? x)
      (/ (+ x 1) x)
      (/ x (+ x 1))))
  (define (next x)
    (+ x 1))
  (define (cal-iter a b)
    (* 4 (product term a next b)))
  (cal-iter 2 n)
  )

(print (time (cal_pi 100)))
(print (time (cal_pi 1000)))
(print (time (cal_pi 10000)))
(print (time (cal_pi 100000)))