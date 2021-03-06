# Point class
![maintained](https://raw.githubusercontent.com/thomashoullier/badges/master/status-maintained.svg)

![stage](https://raw.githubusercontent.com/thomashoullier/badges/master/stage-alpha.svg)

[![Build Status](https://drone.git-or-miss.com/api/badges/thomashoullier/point/status.svg)](https://drone.git-or-miss.com/thomashoullier/point)

[![Coverage Status](https://coveralls.io/repos/github/thomashoullier/point/badge.svg?branch=master)](https://coveralls.io/github/thomashoullier/point?branch=master)

The Common Lisp system `point` is a simple class implementing
a representation for geometrical points in the plane. It is
meant to be used as a base class for working with points
in other projects.

Features:
* Limited to the plane (will be extended as soon as I need higher dimensions).

Please note this system is in ALPHA, the API is likely to change. I will
probably merge this system in a larger 2D geometry library soon.

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

### Export to string
**p-tocsv-str** point => string

Export the coordinates of point to a csv string. It is adapted to double-float
numbers by default. Intended to facilitate concatenation to build csv files.

```common-lisp
(p-tocsv-str (make-point 1 2d3))
;=> "1.0000000000000000e+0 , 2.0000000000000000e+3
"
```

## Dependencies
* `point`:
  * [alexandria](https://gitlab.common-lisp.net/alexandria/alexandria)
* `point/test`:
  * [rove](https://github.com/fukamachi/rove)

## Further work
* The export of point coordinates to string are always exported with a
  scientific notation. This takes up too much space in the case of integers.
  I haven't found a nice library that takes care of this problem for me:
  always writing a sensible string whatever the input number.
