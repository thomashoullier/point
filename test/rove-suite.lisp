;;;; Rove test suite for point.
(in-package :point/test)

(deftest point
  (let ((p1) (p2) (p3))
    (testing "Instantiators"
      (setf p1 (point:make-point 1 2)) (pass "make-point")
      (setf p2 (point:make-point-coords #(3 4)))
      (pass "make-point-coords")
      (setf p3 (point:copy p1)) (pass "copy"))
    (testing "Printer" (format t "~&~A~%" p1) (pass ""))
    (testing "Coordinates readers"
      (ok (and (= 1 (point:px p1)) (= 2 (point:py p1))) "px, py"))
    (testing "Coordinates setters"
      (setf (point:px p3) 14 (point:py p3) 15)
      (ok (and (= 14 (point:px p3)) (= 15 (point:py p3))) "px, py")
      (setf (point:coordinates p2) #(1 2))
      (ok (and (= 1 (point:px p2)) (= 2 (point:py p2))) "coordinates"))
    (testing "Predicates"
      (ok (and (point:p-eq p1 p2) (not (point:p-eq p1 p3))) "p-eq"))))
