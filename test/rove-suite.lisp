;;;; Rove test suite for point-sampling: point class.
(in-package :point-sampling/test)

(deftest point
  (let ((p1) (p2) (p1b))
    (testing "Instantiators"
      (setf p1 (point-sampling:make-point 1 2)) (pass "make-point")
      (setf p2 (point-sampling:make-point-coords #(3 4)))
      (pass "make-point-coords")
      (setf p3 (point-sampling:copy p1)) (pass "copy"))))
