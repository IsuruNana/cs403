-- 1. Draw a diagram that illustrates the internal representation for this Scheme expression:
-- (a (b (c d)) (( )) ((e f) g . h))


-- 2. Write a Scheme function sum_of_products using recursion. Do not use map, foldr, or foldl.
-- Example: (sum_of_products '((1 2 3 4) (5 6 7) (8 9))) returns 306, because 1*2*3*4 + 5*6*7
-- + 8*9 = 24 + 210 + 72 = 306.


-- 3. Write a Scheme function sum_of_products using map, foldr, and/or foldl. Do not use any
-- explicit recursion. Example: (sum_of_products '((1 2 3 4) (5 6 7) (8 9))) returns 306,
-- because 1*2*3*4 + 5*6*7 + 8*9 = 24 + 210 + 72 = 306.


-- 4. Write a Scheme function (scan op id L) where op is an associative and commutative binary
-- function, id is the identity value, and L is a list. It should return a list of the values obtained
-- by folding op across each possible prefix of L. Example:
-- (scan + 0 '(2 3 5 7 11)) returns (0 2 2+3 2+3+5 2+3+5+7 2+3+5+7+11) = (0 2 5 10 17 28).



-- Please read the following information before solving the next two problems.
-- Recall that Scheme provides both let and let* for defining local variables. Consider this example:

-- ;---------------------------------------------------------------------
-- (define a 10)                                                     ---
-- (let ((a 20) (b (* a a))) (+ b 1)) ; returns 10^2 + 1 = 101        ---
-- (let* ((a 20) (b (* a a))) (+ b 1)) ; returns 20^2 + 1 = 401       ---
-- ;---------------------------------------------------------------------

-- The difference is that let performs bindings in parallel, whereas let* performs bindings sequentially.
-- Using let, variable b gets value 10*10 = 100. Using let*, variable b gets value 20*20 = 400.

-- 6. Show that each use of let* can be replaced by uses of let. First write a general expression
-- using let that is equivalent to the general expression (let* ((x1 e1) (x2 e2) … (xn en)) e). Then
-- also apply your same conversion to the specific expression (let* ((a 20) (b (* a a))) (+ b 1)).


-- 7. Show that each use of let can be replaced by uses of let*. First write a general expression
-- using let* that is equivalent to the general expression (let ((x1 e1) (x2 e2) … (xn en)) e). Then
-- also apply your same conversion to the specific expression (let ((a 20) (b (* a a))) (+ b 1)).


-- 8. Write the map function in Scheme by using foldl. Do not use explicit recursion, and do not
-- use either foldr or reverse.

-- Please read the following information before solving the next two problems.

-- An association list (or a-list) is a list of key/data pairs of the form ((k1 . d1) (k2 . d2) … (kn . dn)).
-- Example of an association list: ((apple . red) (lemon . yellow) (lime . green) (banana . yellow)).

-- Also, a property list (or p-list) is a list of alternating keys and data of the form (k1 d1 k2 d2 … kn dn).
-- Example of a property list: (apple red lemon yellow lime green banana yellow).


-- 9. Write a Scheme function (a2p alist) that converts a given alist into the corresponding plist.
-- Do not use the predefined flatten function. Example: (a2p ‘((apple . red) (lemon . yellow)
-- (lime . green) (banana . yellow))) returns (apple red lemon yellow lime green banana yellow).


-- 10. Write a Scheme function (p2a plist) that converts a given plist into the corresponding alist.
-- Example: (p2a ‘(apple red lemon yellow lime green banana yellow)) returns ((apple . red)
-- (lemon . yellow) (lime . green) (banana . yellow)).