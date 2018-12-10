a := #(2 3 -2 6 5 -3).
a fun printNl. “returns 34 + 54 = 706”
s := Set new.
s add: 2 ; add: 3 ; add: -2 ; add: 6 ; add: 5 ; add: -3 .
s fun printNl. “returns 34 + 54 = 706”

Collection extend [
 fun [
   ^(self select: [:x | (x > 0) & (x\\2 == 1)] inject: 0 into: [:id :x | id + (x*x*x*x)])
 ]
].


Object extend Fall2009 [
  applyEvery: fns to: xs [
    |NewArray|
    NewArray := Array new: (fns size).
    1 to: (NewArray size) do: [
      :i | NewArray at: i put: (xs collect: fns at: i)
    ]
  ]
]

b := Bag new init.
b add: 10; add: 20; add: 10.
b getSize. "returns 3"
b count: 10. "returns 2"
b count: 20. "returns 1"
b count: 30. "returns 0"

s := Set new init.
s add: 10; add: 20; add: 10.
s getSize. "returns 2"
s count: 10. "returns 1"
s count: 20. "returns 1"
s count: 30. "returns 0"

Object subclass: #Node.
Node instanceVariableNames: 'value next'.
Node extend [
  value: v next: n [value:=v. next:=n]
  getValue [^value]
  getNext [^next]
]

Object subclass: #Set [
  |Head|
  init [
    Head := Node new.
    Head next: nil.
    ^self
  ]
  add: v [
    |Next|
    Next := Head getNext.
    [Next isNil] whileFalse: [
      (Next getValue = v) ifTrue: [^self] ifFalse: [Next := Next getNext]
    ] 
    Next next: Node new value: v next: nil 
  ]
]

