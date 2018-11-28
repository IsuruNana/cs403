Object subclass: #Node.
Node instanceVariableNames: 'data next'.
Node extend [
  data [^data]
  next [^next]
  data: d [data := d]
  next: n [next := n]
]

Object subclass: #Queue.
Queue instanceVariableNames: 'front back'.
Queue extend [
  insert: key [
    |p|
    p := Node new data: key.
    front isNil
        ifTrue: [front := p. back := p]
        ifFalse: [back next: p. back := p]
  ]
  remove [
    |key|
    front isNil ifTrue: [^nil].
    key := front data.
    front := front next.
    ^key
  ]
  display [
    |p|
    p := front.
    [p notNil] whileTrue: [Transcript display: p data; cr. p := p next]
  ]
]

q := Queue new.
q insert: 20; insert: 40; insert 10; insert: 30.
5 timesRepeat: [Transcript display: q remove; cr].
Transcript cr.

Queue extend [
  do: aBlock [
    |p|
    p := front.
    [p notNil] whileTrue: [aBlock value: p data. p := p next]
  ]
  collect: aBlock [
    |q|
    q := Queue new.
    self do: [:key | q insert: ]
  ]
]
