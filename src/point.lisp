;;;; Point class.
(in-package :point)

(defclass point ()
  ((coordinates :documentation "Vector of point coordinates."
                :accessor coordinates :initarg :coordinates)))

;;; Instantiators
(defun make-point (px py)
  "Point instantiator from coordinates."
  (make-instance 'point
                 :coordinates (make-array 2 :initial-contents (list px py))))

(defun make-point-coords (coordinates)
  "Point instantiator from vector of coordinates."
  (make-instance 'point :coordinates coordinates))

(defmethod copy ((p point))
  "Return a copy of a point."
  (make-instance 'point :coordinates (alexandria:copy-array (coordinates p))))

;;; Printer
(defmethod print-object ((obj point) stream)
  "Printer for point."
  (print-unreadable-object (obj stream :type t)
    (with-slots ((coordinates coordinates)) obj
      (format stream "~A" coordinates))))

;;; Coordinate setf.
(defmethod (setf px) (new-px (p point))
  "Setf the first point coordinate."
  (setf (aref (coordinates p) 0) new-px))

(defmethod (setf py) (new-py (p point))
  "Setf the second point coordinate."
  (setf (aref (coordinates p) 1) new-py))

;; Generated automatically: (setf (coordinates point) #(px py))

;; Coordinate readers.
(defmethod px ((p point)) (aref (coordinates p) 0))
(defmethod py ((p point)) (aref (coordinates p) 1))

(defmethod p-eq ((p1 point) (p2 point))
  "Equality predicate for two points."
  (equalp (coordinates p1) (coordinates p2)))
