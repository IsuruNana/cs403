" 1. Write the output of this Smalltalk program in the space provided."
Object subclass: A [
  u ['a' display. self v. 'b' display]
  v ['c' display. self u. 'd' display]
  w ['e' display]
]
A subclass: B [
  x ['f' display. self u]
  y ['g' display. self v]
]
B subclass: C [
  t [super x. 'h' display. super y]
  w ['i' display. super w. 'j' display]
  x ['k' display. super u. 'l' display]
  y ['m' display. super v. 'n' display]
]
C subclass: D [
  u ['o' display]
  v ['p' display]
]
D subclass: E [
  u ['q' display]
  v ['r' display]
  w ['s' display. super w. 't' display]
]

D new t.
Transcript cr.
z := E new.
z w.
Transcript cr.
z x.
Transcript cr.
z y.
Transcript cr.
" Output: "

"fohgp" "D t"
"siejt" "z w"
"karbl" "z x"
"mcqdn" "z y"


" 2. Most types of birds can fly: eagle, duck, crow, robin. But some types of birds cannot fly:
penguin, ostrich. Draw two object-oriented class inheritance hierarchies, each having a root
class Bird. The leaf classes correspond to the kinds of birds given above. Exactly one class
in each hierarchy defines method canFly to return true, and exactly one class in each
hierarchy defines method canFly to return false.

a. Draw a hierarchy that uses overriding, and show which classes define method canFly.
b. Draw a hierarchy that does not use overriding, and show which classes define method canFly. "



" 3. Completely parenthesize each Smalltalk expression below to show the order of message sends.
You may assume all the indicated methods exist.
a b c d: e f g h: j k m
a + b * c < d – e / f
a b c > d e f + g h j
a > b c: d + e f: g * h j: k – m
Rewrite the following expression in an equivalent way that does not use cascades (semicolons).
a b c: d e: f ; g: h j: k ; m: n p: q
 "

" 4. Write Smalltalk method to:do: for the Integer class. For example, sending the message
0 to: 9 do: [ :k | k display ] should produce the output 0123456789. "


" 5. Write Smalltalk method timesRepeat: for the Integer class. For example, sending the
message 5 timesRepeat: [ ‘ab’ display ] should produce the output ababababab. "


" 6. Write Smalltalk method collect: for the abstract Collection class. (Recall that Smalltalk’s
collect: method is analogous to Scheme’s and Haskell’s map functions.) This method should
work properly when the receiver is an Array, Set, LinkedList, or any other kind of Collection. "


" 7. Write Smalltalk method select: for the abstract Collection class. (Recall that Smalltalk’s
select: method is analogous to Scheme’s and Haskell’s filter functions.) This method should
work properly when the receiver is an Array, Set, LinkedList, or any other kind of Collection. "


" 8. Write Smalltalk method reduce: for the abstract Collection class. Method reduce: is the
same as inject:into: except that it only works on non-empty collections and it lacks an
identity element parameter. (Recall that Smalltalk’s inject:into: method is analogous to
Scheme’s and Haskell’s foldl functions.) This method should work properly when the
receiver is an Array, Set, LinkedList, or any other kind of Collection. "


" 9. Write the output of this Smalltalk program in the space provided."

Object subclass: #A.
A addClassVarName: 'w'.
A instanceVariableNames: 'x y'.
A class instanceVariableNames: 'z'.
A extend [
  init [ w:=w+1. x:=w. y:=self class z. self class incZ ]
  show [ 
    Transcript 
    display: self class ; 
    display: w ; 
    display: x ;
    display: y ; 
    display: self class z ; cr ]
]
A class extend [
  new [ w isNil ifTrue: [w:=-1]. z isNil ifTrue: [z:=0]. ^super new init ]
  z [^z]
  incZ [ z:=z+1 ]
]
A subclass: #B.
A subclass: #C.
A subclass: #D.
r := Array new: 10.
1 to: 3 do: [:k | r at: k put: A new ].
4 to: 5 do: [:k | r at: k put: B new ].
6 to: 8 do: [:k | r at: k put: C new ].
9 to: 10 do: [:k | r at: k put: D new ].
1 to: 10 do: [:k | (r at: k) show ]
Output:




" 10. Extend the given Smalltalk class Pair, so that the class Quadruple can be defined exactly as
shown below, and so that the client code given on the right would then produce the output
as shown. Do not modify the given code, and do not further extend the class Quadruple."

Object subclass: Pair [
  | x y |
  x [ ^x ]
  y [ ^y ]
]
Pair extend [ “add code here”




]
Pair class extend [ “add code here”

]
Pair subclass: #Quadruple.
Quadruple class extend [
 a: aa b: bb c: cc d: dd [
 ^Pair x: (Pair x: aa y: bb)
 y: (Pair x: cc y: dd)
 ]
]

q := Quadruple a: 1 b: 2 c: 3 d: 4.
q print.
(q = q) printNl.
r := Quadruple a: 1 b: 2 c: 3 d: 5.
r print.
(q = r) printNl.
s := q + r.
s print.
(r = s) printNl.
t := r + q.
t print.
(s = t) printNl.

Output:
1234 true
1235 false
2469 false
2469 true 