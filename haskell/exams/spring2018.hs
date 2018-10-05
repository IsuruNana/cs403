-- Write each Haskell function as described below, and also show the type of each function.
-- You may show either the inferred type, or a declared type that suffices for all the given examples.
-- Write any non-standard helper functions that you use, but you don’t need to show their types.

-- 1. (fun f g p id list) determines which values in the list satisfy predicate p, 
-- then applies unary function g to each such value, and then combines all the results using binary function f. 
-- However, if no values satisfy p, then return id. 


-- Examples:
-- fun (+) (^4) (\x -> x>0 && odd x) 0 [2,3,-2,6,5,-3] returns 34 + 54 = 706.
-- fun (:) head (not . null) [ ] ["abcd","","efg","hij","klm","","nopq"] returns "aehkn".
-- fun (++) tail (not . null) [ ] ["abcd","","efg","hij","klm","","nopq"] returns "bcdfgijlmopq".
-- fun :: ________________________________________

fun f g p id list = foldl f id [ g x | x <- list, p x]
-- or
fun f g p id list = foldl f id (map g (filter p list))


-- 2. (isPermutation xs ys) returns True if lists xs and ys are permutations of each other, and otherwise returns False. Examples:
-- isPermutation [1,2,3,4] [2,4,1,3] returns True.
-- isPermutation [1,2,3,4] [3,2,1,0] returns False.
-- isPermutation “abcdef” “fcebda” returns True.
-- isPermutation :: ________________________________________


isPermutation list1 list2 = [True && x == y | x <- (sort list1) , y <- (sort list2)]

isPermutation [ ] [ ] = True
isPermutation [ ] (_:_) = False
isPermutation (x:xs) ys = 
  (any (==x) ys) && isPermutation xs (remove x ys) 
  where
    remove x (y:ys) = 
      if x==y 
        then ys 
      else 
        y:remove x ys


-- 3.(equiv n) returns a list of the equivalence classes of the non-negative integers modulo n, 
-- where each of the n sublists is an infinite list.  
-- Example:  
-- equiv 5 returns [[0,5,10,15,20,...],[1,6,11,16,21,...],[2,7,12,17,22,...],[3,8,13,18,23,...], [4,9,14,19,24,...]]. 

-- equiv :: ________________________________________

equiv n = map (help n) [0..n-1] where
  help n k = k : map (+n) (help n k)

equiv n = [[n * j + k | j <- [0..]] | k <- [0..n-1]]

-- 4. Haskell’s let construct is semantically equivalent to Scheme’s letrec. That is, the following two expressions are equivalent:
-- Scheme: (letrec ((x1 e1) (x2 e2) … (xn en)) e)
-- Haskell: let { x1=e1; x2=e2; … xn=en; } in e
-- For each Scheme expression below, write an equivalent Haskell expression using anonymous functions (lambdas):
-- a. Scheme: (let ((x1 e1) (x2 e2) … (xn en)) e)
-- Haskell:
(\(x1, x2, ..., xn) -> e ) (e1, e2, e3, ..., en)
Haskell: (\(a, b, c) -> a*b*c) (2, a+1, b+1)

-- b. Scheme: (let* ((x1 e1) (x2 e2) … (xn en)) e)
-- Haskell:

(\x1 -> (\x2 -> … (\xn -> e) en) … e2) e1)
Haskell: (\a -> (\b -> (\c -> a*b*c) (b+1)) (a+1)) 2

-- 5. CS 403: (evalpoly p v) takes a polynomial with coefficients given in list p, and evaluates it at v. 
-- Example: The list [2,3,5,6,8,9] denotes polynomial 2 + 3x + 5x2 + 6x3 + 8x4 + 9x5, 
-- therefore evalpoly [2,3,5,6,8,9] 10 returns 2 + 3*10 + 5*102 + 6*103 + 8*104 + 9*105 = 986532.

evalpoly p v =
  foldl (+) 0 [ x ^ power | x <- p , power <- [0..(len v)] ]

evalpoly p x = foldl (+) 0 (zipWith (*) p (map (x^) [0..]))

-- CS 503: Write the evalpoly function described above using both of these two different styles:
-- (i) Use recursion, but do not call any predefined higher-order functions.
-- (ii) Use predefined higher-order functions, but do not write any recursion.
-- evalpoly :: ________________________________________



-- 6. CS 403: (evaluate e) evaluates expression e using the data type Expr shown below. 
-- Example: evaluate (Mul (Add (Val 3) (Val 4)) (Sub (Val 8) (Neg (Val 2)))) returns (3+4)*(8-(-2)) = 70.
-- data Expr = Val Integer | Neg Expr | Add Expr Expr | Sub Expr Expr | Mul Expr Expr

evaluate (Val e) = e
evaluate (Neg e) = – evaluate e
evaluate (Add e1 e2) = evaluate e1 + evaluate e2
evaluate (Sub e1 e2) = evaluate e1 – evaluate e2
evaluate (Mul e1 e2) = evaluate e1 * evaluate e2

-- CS 503: (evaluate e list) evaluates expression e using the data type Expr shown below. The list contains pairs of identifiers and their integer values. Example:
-- evaluate (Mul (Add (Sym "w") (Sym "x")) (Sub (Sym "y") (Neg (Sym "z")))) [("w",3),("x",4),("y",8),("z",2)] returns (3+4)*(8-(-2)) = 70.
-- data Expr = Val Integer | Sym String | Neg Expr | Add Expr Expr | Sub Expr Expr | Mul Expr Expr
-- evaluate :: ________________________________________