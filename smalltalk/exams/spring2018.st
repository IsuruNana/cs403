" 1. Completely parenthesize each expression below to show the order of message sends.
(Assume all the given methods exist.)
group asSet asBag printString display
1 * 2 + 3 - 4 / 5 * 6 - 7
circle origin <= 8 r @ 9 s
t long > u short age: v w + x y
cat || bird copyFrom: dog size to: z mouse at: fish scale
A b c: d + e f: g h j: k * m n: p q
Also rewrite the following expression in an equivalent way that does not use cascades (semicolons).
Circle new point: 3 @ 4 ; radius: cat at: 5 ; color: dog name "


" 2. (c fun) returns the sum of the fourth powers of all the odd positive numbers in Collection c.
Note that C may be any type of collection such as an array, set, linked list, etc. Examples:
a := #(2 3 -2 6 5 -3).
a fun printNl. “returns 34 + 54 = 706”
s := Set new.
s add: 2 ; add: 3 ; add: -2 ; add: 6 ; add: 5 ; add: -3 .
s fun printNl. “returns 34 + 54 = 706”
Collection extend [
 fun [

 ]
]. "


" 3. (c totalsize) returns the total number of atomic values nested within all levels of Collection c.
Note that c may be any type of Collection such as an array, set, linked list, etc. Examples:
a := #(2.7 #( ) #(3.1 #(4 #( #(true #( )) $c #( #(5)) $x)) #( )) false).
a totalsize printNl. “returns 8”
s := Set new.
s add: #(2.7 3.1) ; add: 4 ; add: #(true $c 5) ; add: #( ) ; add: #($x) ; add: #( #(false) ) .
s totalsize printNl. “returns 8”
Collection extend [
 totalsize [
 ]
]. "



" 4. (c flatten) returns a flattened OrderedCollection that contains all the values nested within
Collection c. Note that C may be any type of collection such as an array, set, linked list, etc.
Examples:
a := #(2.7 #( ) #(3.1 #(true #( #(4 #( )) $c #( #(5)) $x)) #( )) false).
a flatten printNl. “returns OrderedCollection (2.7 3.1 true 4 $c 5 $x false)”
s := Set new.
s add: #(2.7 3.1) ; add: 4 ; add: #(true $c 5) ; add: #( ) ; add: #($x) ; add: #( #(false) ) .
s flatten printNl. “returns a permutation of OrderedCollection (2.7 3.1 true 4 $c 5 $x false)”
Collection extend [
 flatten [
 ]
]. "



" 5. CS 403: (counter value) returns a new block that maintains an internal memory (initially 0)
and that will behave as shown below upon subsequent evaluations of this block. Example:
f := counter value.
g := counter value.
(f value: 6) printNl. “returns 0+6 = 6”
(f value: 7) printNl. “returns 6+7 = 13”
(f value: 8) printNl. “returns 13+8 = 21”
(g value: 9) printNl. “returns 0+9 = 9”
(g value: 10) printNl. “returns 9+10 = 19”
(f value: 11) printNl. “returns 21+11 = 32”
(g value: 12) printNl. “returns 19+12 = 31”


CS 503: (counter value) returns a new block that maintains an internal memory (initially 0)
and that will behave as shown below upon subsequent evaluations of this block. Example:
f := counter value.
g := counter value.
(f value: #add value: 6) printNl. “returns 0+6 = 6”
(f value: #add value: 7) printNl. “returns 6+7 = 13”
(f value: #add value: 8) printNl. “returns 13+8 = 21”
(g value: #sub value: 9) printNl. “returns 0-9 = -9”
(g value: #sub value: 10) printNl. “returns -9-10 = -19”
(f value: #sub value: 11) printNl. “returns 21-11 = 10”
(g value: #add value: 12) printNl. “returns -19+12 = -7” "



" 6. CS 403: (e eval) evaluates expression e using the class Expr to be defined below. Example:
e := Mul new left: (Add new left: (Val new put: 3) right: (Val new put: 4))
 right: (Sub new left: (Val new put: 8) right: (Neg new put: (Val new put: 2))).
e eval printNl. “returns (3+4)*(8-(-2)) = 70”


CS 503: (e eval: d) evaluates expression e using the class Expr to be defined below.
Dictionary d maps identifiers to their integer values. Example:
e := Mul new left: (Add new left: (Sym new put: #w) right: (Sym new put: #x))
 right: (Sub new left: (Sym new put: #y) right: (Neg new put: (Sym new put: #z))).
d := Dictionary new.
d at: #w put: 3 ; at: #x put: 4 ; at: #y put: 8 ; at: #z put: 2 .
(e eval: d) printNl. “returns (3+4)*(8-(-2)) = 70”
Object subclass: #Expr.
Write any additional subclasses and methods that you need to create and evaluate such expressions.
Use object-oriented style including at least these subclasses: Val, Neg, Add, Sub, Mul (Sym for 503). "