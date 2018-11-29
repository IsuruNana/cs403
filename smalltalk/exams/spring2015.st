" 1. Write the output values that are printed by this Smalltalk code. Be especially careful
when determining which value is printed first.

x := 30.
block1 := [x := (3*x)+1].
block2 := [x := x/2].
x := 24.
block3 := [x>=2].
block4 := [Transcript display: x; space.
          x odd ifTrue: block1 ifFalse: block2].
x := 18.
block5 := [block3 whileTrue: block4].
block5 value.
Transcript display: x; cr.
x := 0. "



" 2. List five (or more) most significant ways that Smalltalk differs from C++ and/or Java. "


"3. Write a Smalltalk class named Interval whose instances represent continuous finite
ranges on the real number line. The class should behave as in the following example.

X := Interval new left: 0 right: 4. X is the interval from 0 to 4
Y := Interval new left: 2 right: 7. Y is the interval from 2 to 7
Z := Interval new left: 5 right: 11. Z is the interval from 5 to 11
X length. returns 4
Y length. returns 5
Z length. returns 6
X disjoint: Y. returns false
X disjoint: Z. returns true
Y disjoint: X. returns false
Y disjoint: Z. returns false
Z disjoint: X. returns true
Z disjoint: Y. returns false
X intersects: Y. returns true
X intersects: Z. returns false
Y intersects: X. returns true
Y intersects: Z. returns true
Z intersects: X. returns false
Z intersects: Y. returns true"

Object subclass: Interval [
  |left right|
  left: l right: r [left := l. right := r]
  length: [^(right-left)]
  getLeft: [^left]
  getRight: [^right]

  disjoint: otherInterval [
    |otherLeft otherRight|
    otherLeft := otherInterval getLeft.
    otherRight := otherInterval getRight.

    ^(left > otherRight) or: [right < otherLeft]
  ]
  intersects: otherInterval [^ (disjoint otherInterval) not]
]


" 4. Write two Smalltalk classes, Bag and Set, so that the client code below will behave as
shown. Note that a Bag allows duplicate values, but a Set does not. Your classes may use
the Node class shown below, but do not use any classes in Smalltalk’s predefined Collection
hierarchy. Minimize the amount of code you write by using inheritance.

b := Bag new init.
b add: 10; add: 20; add: 10.
b getSize. returns 3
b count: 10. returns 2
b count: 20. returns 1
b count: 30. returns 0

s := Set new init.
s add: 10; add: 20; add: 10.
s getSize. returns 2
s count: 10. returns 1
s count: 20. returns 1
s count: 30. returns 0

Object subclass: #Node.
Node instanceVariableNames: 'value next'.
Node extend [
  value: v next: n [value:=v. next:=n]
  getValue [^value]
  getNext [^next]
] "

" 5. In Smalltalk, a message sent to a receiver named super is implemented as a message sent to
self, except that method search does not begin in the receiver’s class as it normally would.
Two proposed implementations of super are described below. If these two implementations
are equivalent, then explain why both implementations always produce the same result.
Otherwise provide a counterexample and show that the two implementations can produce
different results. Also state which, if either, of these two implementations is correct.

A. Method search begins in the superclass of the receiver’s class.
B. Method search begins in the superclass of the class that defines the method that sends
the message to super. "


" 6. Draw a well-designed object-oriented class inheritance hierarchy that satisfies the “is-a”
relationship (or “principle of substitutability”) and that includes these classes:

Hawk, Grass, Tree, Reptile, Dog, Mammal, Pine, Cat, Cobra, Poodle, Animal, Rose, Bird,
LivingThing, Snake, Oak, Plant, Shark, Lion, Flower, Fish. "



" 7. Trace this (GNU-style) Smalltalk code and show the outputs on the indicated blank lines.

-------------------------------------------------------
Object subclass: #A.
A extend [
f: x at: k [x at: k put: 7. self g: x at: k+1]
g: x at: k [x at: k put: 8. self h: x at: k+1]
h: x at: k [x at: k put: 9. self i: x at: k+1]
i: x at: k [x at: k put: 10. self j: x at: k+1]
j: x at: k [x at: k put: 11. self k: x at: k+1]
k: x at: k [x at: k put: 12]
]
A subclass: #B.
B extend [
f: x at: k [x at: k put: 13. self g: x at: k+1]
h: x at: k [x at: k put: 14. self i: x at: k+1]
j: x at: k [x at: k put: 15. self k: x at: k+1]
]
A subclass: #C.
C extend [
g: x at: k [x at: k put: 16. self h: x at: k+1]
i: x at: k [x at: k put: 17. self j: x at: k+1]
k: x at: k [x at: k put: 18]
]
-------------------------------------------------------

y := Array new: 6.
B new f: y at: 1.
y do: [:w | w printNl].
____
____
____
____
____
____ 
(y collect: [:w | 3*w]) printNl.
________________________
(y select: [:w | w even]) printNl.
________________________
(y inject: 0 into: [:m :n | m+n]) printNl.
____

-------------------------------------------------------
z := Array new: 6.
C new f: z at: 1.
z do: [:w | w printNl].
____
____
____
____
____
____ 
(z collect: [:w | 3*w]) printNl.
________________________
(z reject: [:w | w even]) printNl.
________________________
(z inject: 0 into: [:m :n | m+n]) printNl. "