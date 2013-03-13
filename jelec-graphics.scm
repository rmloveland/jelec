;;; Jelec Graphics

;; We will use the excellent FPS package for the various diagrams in the text.

(define show-with-output-file show-w/ps2-text-channel)

(define (distance pt1 pt2)
  ;; Point Point -> Number
  (let* ((dx (- (pt:x pt1) (pt:x pt2)))
	 (dy (- (pt:y pt1) (pt:y pt2)))
	 (dist (sqrt (+ (* dx dx)
			(* dy dy)))))
    dist))

(define (equilateral-triangle-points origin radius)
  ;; Point Number -> Path
  (let* ((vertex-top (pt (pt:x origin)
			(+ radius (pt:y origin))))
	 (line1 (line origin vertex-top))
	 (line2 (rotate (deg->rad 60) line1))
	 (vertex-right (end-pt line2))
	 (vertex-left (pt (pt:x vertex-right)
			  (- (pt:y vertex-right)))))
    (values vertex-top vertex-right vertex-left)))

;; call like so:
;; (receive (a b c) (equilateral-triangle-points (pt 100 100) 80) (line a b c))

(define page-width (* 8.5 72))

(define page-height (* 11 72))

(define page-center (pt (/ page-width 2)
			(/ page-height 2)))
