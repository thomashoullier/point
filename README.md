# Point class
![maintained](https://raw.githubusercontent.com/thomashoullier/badges/master/status-maintained.svg)

[![Build Status](https://drone.git-or-miss.com/api/badges/thomashoullier/point/status.svg)](https://drone.git-or-miss.com/thomashoullier/point)

[![Coverage Status](https://coveralls.io/repos/github/thomashoullier/point/badge.svg?branch=master)](https://coveralls.io/github/thomashoullier/point?branch=master)

The Common Lisp system `point` is a simple class implementing
a representation for geometrical points in the plane. It is
meant to be used as a base class for working with points
in other projects.

Features:
* Limited to the plane (will be extended as soon as I need higher dimensions).

## Usage
The class `point` simply holds a vector of coordinates and implements utility
methods around it.

### Instantiate
The following instantiators are available:

```common-lisp
(make-point 1 4) ;=> #<POINT #(1 4)>
(make-point-coords #(2d0 1.5d0)) ;=> #<POINT #(2.0d0 1.5d0)>
```

Points may also be instantiated via the copying method:

```common-lisp
(defparameter *p1* (make-point 1 2))
(p-cpy *p1*) ;=> #<POINT #(1 2)>
```

### Coordinates access
Coordinates may be read or set in the following way:

```common-lisp
(px *p1*) ;=> 1
(py *p1*) ;=> 2
(coordinates *p1*) ;=> #(1 2)

(setf (px *p1*) 3)
(setf (py *p1*) 4)
*p1* ;=> #<POINT #(3 4)>

(setf (coordinates *p1*) #(11 12))
*p1* ;=> #<POINT #(11 12)>
```

### Predicates
There is an equality predicate.

```common-lisp
(defparameter *p2* (p-cpy *p1*))
(p-eq *p1* *p2*) ;=> T
```

## Dependencies
* `point`:
  * [alexandria](https://gitlab.common-lisp.net/alexandria/alexandria)
* `point/test`:
  * [rove](https://github.com/fukamachi/rove)
