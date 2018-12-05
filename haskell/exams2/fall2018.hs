-- Write each Scheme function as described below, and also write any non-standard helper
-- functions that you use. You may use these standard functions unless explicitly forbidden:
-- define, if, cond, +, -, *, /, square, quotient, modulo, =, <, <=, >, >=, eq?, not, and, or, min, max,
-- car, cdr, cons, list, null?, pair?, list?, number?, integer?, symbol?, boolean?, procedure?, length,
-- append, reverse, flatten, map, fold-left, fold-right, zip, filter, let, let*, letrec, lambda, quote.
-- Do not use "set!" except where explicitly permitted. You may omit any two problems.

-- 1. (last L) and (init L) return the last element of list L and all elements but the last element of
-- list L, respectively. Example: (last '(a b c d)) returns d, and (init '(a b c d)) returns (a b c).
-- [20 points]
-- (define (last L)
-- (define (init L)


-- 2. (antitranspose m) returns the anti-transpose of matrix m, which is represented as a list of lists.
-- Anti-transpose is similar to transpose, but it flips the matrix differently as shown below.
-- Example: (antitranspose '((a b c) (d e f) (g h j) (k m n))) returns ((n j f c) (m h e b) (k g d a)).
-- [20 points]

-- (define (antitranspose m)


-- 3. (apply-left funlist x) and (apply-right funlist x) successively apply all the functions in the
-- funlist beginning with value x. Example: Suppose inc is (lambda (x) (+ x 1)) and double is
-- (lambda (x) (* x 2)). Then (apply-left (list inc double square) 5) returns ((5 + 1) * 2)2 = 144.
-- Also (apply-right (list inc double square) 5) returns ((52) * 2) + 1 = 51. [20 points]
-- (define (apply-left funlist x)
-- (define (apply-right funlist x)


-- 5. (maxdepth L) returns the maximum depth of parentheses nesting in list L. Examples:
-- (maxdepth '((a) (b (c (d) e) f) (g))) returns 4, and (maxdepth '(( ) ( ( ( ) ) ) ( ))) also returns 4.
-- [20 points]
-- (define (maxdepth L)

-- 6. (counter val) and (counter) return a new function that behaves as shown below. The initial value
-- of each counter may be given as an optional parameter, but otherwise it defaults to 0. The new
-- function that is returned accepts two parameters: the first denotes an operation (‘add or ‘sub or
-- ‘mul), and the second denotes an operand. You are permitted to use “set!” for this problem.
-- [20 points]
-- (define f (counter))
-- (define g (counter 100))
-- (f 'add 4) ; returns 4
-- (f 'add 5) ; returns 9
-- (f 'sub 6) ; returns 3
-- (f 'mul 7) ; returns 21
-- (g 'add 8) ; returns 108
-- (g 'sub 9) ; returns 99
-- (g 'mul 10) ; returns 990
-- (f 'add 11) ; returns 32
-- (g 'sub 12) ; returns 978
-- (define (counter . args)