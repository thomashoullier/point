;;;; Rove test suite for point.
(in-package :point/test)

(deftest point
  (let ((p1) (p2) (p1b))
    (testing "Instantiators"
      (setf p1 (point:make-point 1 2)) (pass "make-point")
      (setf p2 (point:make-point-coords #(3 4)))
      (pass "make-point-coords")
      (setf p3 (point:copy p1)) (pass "copy"))))
