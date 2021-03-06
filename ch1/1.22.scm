(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (next n)
  (if (= n 2)
    3
    (+ n 3)))
(define (divides? a b)
  (= (remainder b a) 0))

(define (square a) (* a a))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (find-prime n)
  (if (prime? n)
    (print n)
    (find-prime (+ n 1)))
  )
(define (exp10 n)
  (if (= n 0)
    1
    (* 10 (exp10 (- n 1))))
  )
