;;; Jelec Graphics

;; We will use the excellent FPS package for the various diagrams in the text.

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
