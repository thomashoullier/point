(defsystem point
  :name "point"
  :author "Thomas HOULLIER"
  :depends-on ("alexandria")
  :components
  ((:module "src"
    :components ((:file "package")
                 (:file "point" :depends-on ("package")))))
  :in-order-to ((test-op (test-op "point/test"))))

(defsystem point/test
  :name "point/test"
  :author "Thomas HOULLIER"
  :depends-on ("point" "rove")
  :components
  ((:module "test"
    :components ((:file "package")
                 (:file "rove-suite" :depends-on ("package")))))
  :perform (test-op (o c) (symbol-call :rove '#:run c)))
