(defsystem point-sampling
  :name "point-sampling"
  :author "Thomas HOULLIER"
  :depends-on ("alexandria")
  :components
  ((:module "src"
    :components ((:file "package")
                 (:file "point" :depends-on ("package"))))))
