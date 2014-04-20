;;; code taken from PG's ANSI Common Lisp
;;; calling from CCL causes problems--see below


(defun quicksort (vec l r)
  (let ((i l)
	(j r)
	(p (svref vec (round (+ l r) 2))))
    (while (<= i j)
      (while (< (svref vec i) p) (incf i))
      (while (> (svref vec j) p) (decf j))
      (when (<= i j)
	(rotatef (svref vec i) (svref vec j))
	(incf i)
	(decf j)))
    (if (> (- j l) 1) (quicksort vec l j))
    (if (> (- r i) 1) (quicksort vec i r)))
  vec)

(defmacro while (test &rest body)
  `(do ()
       ((not ,test))
     ,@body))


;; (quicksort #(0 1 2 3) 0 3)
;; #(0 1 2 3)
;; CL-USER> (quicksort #(1 0 2 3) 0 3)
;; #(1 0 2 3)
;; CL-USER> (quicksort #(1 0 2 3) 0 2)
;; #(0 1 2 3)
;; CL-USER> (quicksort #(1 0 3 2) 0 2)
;; #(0 1 3 2)
;; CL-USER> (quicksort #(1 0 3 2) 0 3)
;; #(0 1 2 3)
;; CL-USER> (quicksort #(1 0 3 2 4 11 9 5) 0 3)
;; #(0 1 2 3 4 11 9 5)
;; CL-USER> (quicksort #(1 0 3 2 4 11 9 5) 0 7)
;; #(0 1 2 3 4 5 9 11)

;;; CL-USER> (quicksort #(2 3 1 4 6 4 0 2 11) 0 5)
; Evaluation aborted on #<CCL::CALL-SPECIAL-OPERATOR-OR-MACRO #x30200122546D>.

;;; Proving that calling WHILE does work in CCL

;; CL-USER> (let ((x 0))
;; 	   (while (< x 10)
;; 	     (princ x)
;; 	     (incf x)))
;; 0123456789
;; NIL

;;; code taken from PG's ANSI Common Lisp
;;; calling from CCL causes problems--see below

(defun quicksort (vec l r)
  (let ((i l)
	(j r)
	(p (svref vec (round (+ l r) 2))))
    (while (<= i j)
      (while (< (svref vec i) p) (incf i))
      (while (> (svref vec j) p) (decf j))
      (when (<= i j)
	(rotatef (svref vec i) (svref vec j))
	(incf i)
	(decf j)))
    (if (> (- j l) 1) (quicksort vec l j))
    (if (> (- r i) 1) (quicksort vec i r)))
  vec)

(defmacro while (test &rest body)
  `(do ()
       ((not ,test))
     ,@body))


;; (quicksort #(0 1 2 3) 0 3)
;; #(0 1 2 3)
;; CL-USER> (quicksort #(1 0 2 3) 0 3)
;; #(1 0 2 3)
;; CL-USER> (quicksort #(1 0 2 3) 0 2)
;; #(0 1 2 3)
;; CL-USER> (quicksort #(1 0 3 2) 0 2)
;; #(0 1 3 2)
;; CL-USER> (quicksort #(1 0 3 2) 0 3)
;; #(0 1 2 3)
;; CL-USER> (quicksort #(1 0 3 2 4 11 9 5) 0 3)
;; #(0 1 2 3 4 11 9 5)
;; CL-USER> (quicksort #(1 0 3 2 4 11 9 5) 0 7)
;; #(0 1 2 3 4 5 9 11)

;;; CL-USER> (quicksort #(2 3 1 4 6 4 0 2 11) 0 5)
; Evaluation aborted on #<CCL::CALL-SPECIAL-OPERATOR-OR-MACRO #x30200122546D>.
