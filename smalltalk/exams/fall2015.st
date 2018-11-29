" 1. Write a Smalltalk method collect: for the given LinkedList class. Recall that Smalltalk’s
collect: method is analogous to Scheme’s and Haskell’s map functions.

Object subclass: Node [
  |data next|
  data: d [data := d]
  next: n [next := n]
  getData [^data]
  getNext [^next]
]

"
Collection subclass: LinkedList [
  |front|
  front: f [front := f]

  collect: function [
    |ReturnList NextNode IsFirstNode TempNode|
    NextNode := front.
    IsFirstNode := nil.
    ReturnList := self class new.
    [NextNode notNil] whileTrue: [
      "Create a new node by getting original data and applying function to it"
      TempNode := Node new data: (function value: NextNode getData)
      "If this is the first node we are working with, front is tempnode, else 
      the next node of the current node is the TempNode we created"
      IsFirstNode isNil ifTrue: [ReturnList front: TempNode] ifFalse: [NextNode next: TempNode]
      NextNode := NextNode getNext.
      IsFirstNode := TempNode.
    ]
    ^ReturnList
  ]
] 

" The next three problems will use this object-oriented class inheritance hierarchy:

The clients traced below illustrate how some of these classes should behave. Note: the
perimeter of a box or cube is the sum of all its edge lengths, and the area of a box or cube
denotes its surface area. Using the hierarchy shown above, the goal is to minimize the amount
of code you must write by reusing as much code as possible. Hint: let each class define at most
two instance variables, which do not necessarily always denote numbers.

r:=Rectangle new width: 3 length: 4.
r dimensions. returns 2
r perimeter. returns 14
r area. returns 12
r volume. returns 0
r display. prints these lines:
Dimensions=2
Perimeter=14
Area=12
Volume=0


b:=Box new width: 3 length: 4 height: 5.
b dimensions. returns 3
b perimeter. returns 48
b area. returns 94
b volume. returns 60
b display. prints these lines:
Dimensions=3
Perimeter=48
Area=94
Volume=60


s:=Square new side:6.
s dimensions. returns 2
s perimeter. returns 24
s area. returns 36
s volume. returns 0
s display. prints these lines:
Dimensions=2
Perimeter=24
Area=36
Volume=0


c:=Cube new side:10.
c dimensions. returns 3
c perimeter. returns 120
c area. returns 600
c volume. returns 1000
c display. prints these lines:
Dimensions=3
Perimeter=120
Area=600
Volume=1000 "


" Shape
Two_Dimensional_Shape Point Three_Dimensional_Shape
Rectangle Ellipse Triangle Sphere Cylinder Box
Square Circle Equilateral_Triangle Right_Triangle Cube "


" 2. Write classes Shape, Two_Dimensional_Shape, and Three_Dimensional_Shape in Smalltalk. "

"Object subclass: Shape [
  |dimensions|
  new: numDimensions [
    |instance|
    instance := super new.
    dimensions := numDimensions
    ^ instance
  ]
  display [
    Transcript display: 'Dimensions='; dimensions; cr.
  ]
]

Shape subclass: Two_Dimensional_Shape [
  |length width|
  new: lengthArg; widthArg [
    |twoDShape|
    twoDShape := super new 2.
    length := lengthArg.
    width := widthArg.
    ^twoDShape.
  ]
  getLength: [^length]
  getWidth: [^width]
]

Shape subclass: Three_Dimensional_Shape [
  
  new  [
    |threeDShape|
    threeDShape := super new 3.
  ]
]"

" 3. Write classes Rectangle and Square in Smalltalk. "

Two_Dimensional_Shape subclass: Rectangle [
  |width length|
  width: x [width := x]
  length: y [length := y]
  perimeter: [^ 2*length + 2*width]
  area: [^length*width]
]

Rectangle subclass: Square [
  side: x [self width: x length: x]
]

" 4. Write classes Box and Cube in Smalltalk. "

" 5. Describe how class variables and class methods are different from instance variables
and instance methods in an object-oriented programming language such as Smalltalk.
Also, explain the concepts of meta-classes and class-instance variables. Finally, provide
an example such that each kind of variable (class variable, instance variable, and classinstance
variable) yields a distinct result. (It is sufficient to just explain such an example
without writing any actual Smalltalk code.) "




" 6. When a C++ or Java program is executed, each class has a VMT (virtual method table, or
V-table) that stores the addresses of all the methods that can be invoked on instances of
this class. However, in Smalltalk, each class has a DMT (dynamic method table) that
stores the signatures and addresses of only the methods that are defined in this class,
and also contains a pointer to the DMT of its superclass to access the inherited
methods. State the primary advantages and/or disadvantages of using each approach.
Also, provide an example and draw these two different data structures to illustrate
these advantages and disadvantages. (It is sufficient to just explain such an example
without writing any actual Smalltalk code.) "