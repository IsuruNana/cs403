" 1. Trace this (Squeak) Smalltalk code and show the output in the space indicated."

x := 11.
A := Array new: 6.
1 to: A size do: [:j | x := (((x \\ 2) = 1) “ \\ is the mod operator”
 ifTrue: [3 * x + 1]
 ifFalse: [x / 2]).
 A at: j put: x].
A do: [:y | Transcript show: y; space].

Transcript cr; show: (A collect: [:z | z + 11]); cr.
Transcript show: (A select: [:z | z > 30]); cr.
Transcript show: (A reject: [:z | z > 30]); cr.
Transcript show: (A inject: 0 into: [:y :z | y>z ifTrue: [y] ifFalse: [z]]); tab.
Transcript show: (A inject: 99 into: [:y :z | y<z ifTrue: [y] ifFalse: [z]]); cr.
Output: 

"A = [34 17 52 26 13 40]"
34 17 52 26 13 40
#(45 28 63 37 24 51)
#(34 52 40)
#(17 26 13)
52 13


" 2. Trace this (Gnu) Smalltalk code and show the output in the space indicated."

Object class extend [ 
  p: x [ Transcript show: (x printString , self printString); cr] 
]

Object subclass: A [
 m: x [x < 5 ifTrue: [self n: 5 * x] ifFalse: [self class superclass p: x]]
 n: x [x < 5 ifTrue: [self m: 20 * x] ifFalse: [self class p: x]]
]
A subclass: B [ m: x [super m: x+1] ]
B subclass: C [ n: x [super n: x+1] ]
C subclass: D [ m: x [super m: x+1] ]
D subclass: E [ n: x [super n: x+1] ]

X := Array new: 5.
X at: 1 put: A;
 at: 2 put: B;
 at: 3 put: C;
 at: 4 put: D;
 at: 5 put: E.
X do: [:y | y new m: 1; n: 1].

" A m: 1 n: 1 "


" For the remaining problems, write each of these methods using Smalltalk. Except for
method printOn:, each method definition is not permitted to call any other method
with the identical name from any other class. "





" 3. Write method printOn: for the ComplexNumber class. Assume that ComplexNumber has
two instance variables, real and imag. Example outputs: 5-2i, -7+6i. "



" 4. Write method printOn: for the Array class. Example outputs: #(10 20 30), #(). "


" 5. Write method do: for the Array class "



" 6. Write method collect: for the Array class "


" 7. Write method asSet for the Array class "


" 8. Write method asArray for the Set class "


" 9. Write method select: for the Set class "


" 10. Write method do: for the LinkedList class. Assume this (Gnu-style) definition.
Object subclass: #Node.
Node instanceVariableNames: 'data next'.
Node extend [ data [^data] next [^next] data: d next: n [data := d. next := n] ]
Collection subclass: #LinkedList.
LinkedList instanceVariableNames: 'front'. "



" 11. Write method inject:into: for the abstract Collection class. This method should work
properly when the receiver is an Array, Set, LinkedList, or any other kind of Collection. "




" 12. Write method detect:ifNone: for the abstract Collection class. This method should work
properly when the receiver is an Array, Set, LinkedList, or any other kind of Collection. "