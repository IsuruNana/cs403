; 1. (fun L) returns the sum of the fourth powers of all the odd positive numbers in the list L.
; Example: (fun '(2 3 -2 6 5 -3)) returns 3^4 + 5^4 = 706.


; 2. (matrix r c x) returns a matrix which is represented as a list of lists. The matrix will have r rows
; and c columns, and will contain elements with successive values x, x+1, x+2, … Example:
; (matrix 3 4 1) returns ((1 2 3 4) (5 6 7 8) (9 10 11 12)). Hint: write a helper function that
; produces one row of the matrix.


; 3. (transpose M) returns the transpose of matrix M, which is represented as a list of lists.
; Example: (transpose ‘((1 2 3) (4 5 6) (7 8 9) (10 11 12))) returns ((1 4 7 10) (2 5 8 11) (3 6 9 12)).
; You are not permitted to use zip for this problem.


; 4. Scheme provides both let and let* to define local variables, but both can be replaced by lambdas.
; a. First write an expression using lambda that is equivalent to (let ((x1 e1) (x2 e2) … (xn en)) e).
; b. Next write an expression using lambda that is equivalent to (let* ((x1 e1) (x2 e2) … (xn en)) e).


; 5. CS 403 version: (counter) returns a new function that returns a sequence of positive integers
; 1, 2, 3, … upon subsequent calls of this function. You are permitted to use the “set!” function.
; Example:
; (define f (counter))
; (define g (counter))
; (f) ; returns 1
; (f) ; returns 2
; (f) ; returns 3
; (g) ; returns 1
; (g) ; returns 2
; (f) ; returns 4
; (g) ; returns 3

 
; CS 503 version: (counter) returns a new function that accepts parameters either ‘increment or
; ‘decrement. The initial value of each counter is 0. You are permitted to use the “set!” function.
; Example:
; (define f (counter))
; (define g (counter))
; (f 'increment) ; returns 1
; (f 'increment) ; returns 2
; (f 'increment) ; returns 3
; (g 'decrement) ; returns –1
; (g 'decrement) ; returns –2
; (f 'decrement) ; returns 2
; (g 'increment) ; returns –1


; 6. CS 403: (evaluate e) evaluates expression e that will only include operations add, sub, mul,
; and integer values. Example: (evaluate ‘(mul (add 3 4) (sub 8 2))) returns (3+4)*(8–2) = 42.


; CS 503: (evaluate e L) evaluates expression e that will only include operations add, sub, mul,
; integer values, and identifiers. List L contains pairs of identifiers and their integer values.
; Example: (evaluate ‘(mul (add w x) (sub y z)) ‘((w . 3) (x . 4) (y . 8) (z . 2))) returns 7*6 = 42.
