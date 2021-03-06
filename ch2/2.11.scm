(load "ch2/2.07.scm")

(define (mul-interval x y)
  (define (which-case x)
    (cond ((and (>= (upper-bound x) 0) (>= (lower-bound x) 0)) 0)
          ((and (>= (upper-bound x) 0) (<= (lower-bound x) 0)) 1)
          ((and (<= (upper-bound x) 0) (<= (lower-bound x) 0)) 2)))
  (let ((case-xy (+ (* 3 (which-case x)) (which-case y)))
        (ux (upper-bound x))
        (lx (lower-bound x))
        (uy (upper-bound y))
        (ly (lower-bound y)))
    (cond ((= case-xy 0) (make-interval (* lx ly) (* ux uy)))
          ((= case-xy 1) (make-interval (* ux ly) (* ux uy)))
          ((= case-xy 2) (make-interval (* ux ly) (* lx uy)))
          ((= case-xy 3) (make-interval (* lx uy) (* ux uy)))
          ((= case-xy 4) (make-interval (min (* ux ly) (* lx uy))
                                        (max (* ux uy) (* lx ly))))
          ((= case-xy 5) (make-interval (* ux ly) (* lx ly)))
          ((= case-xy 6) (make-interval (* lx uy) (* ux ly)))
          ((= case-xy 7) (make-interval (* lx uy) (* lx ly)))
          ((= case-xy 8) (make-interval (* ux uy) (* lx ly))))))

;test
(define x (make-interval 4 9))
(define y (make-interval -4 9))
(define z (make-interval 4 -9))

(mul-interval x x)
;(make-interval 16 81)
(mul-interval x y)
;(make-interval -36 81)
(mul-interval x z)
;(make-interval -81 36)
(mul-interval y x)
;(make-interval -36 81)
(mul-interval y y)
;(make-interval -36 81)
(mul-interval y z)
;(make-interval -81 36)
(mul-interval z x)
;(make-interval -81 36)
(mul-interval z y)
;(make-interval -81 36)
(mul-interval z z)
;(make-interval -36 81)
