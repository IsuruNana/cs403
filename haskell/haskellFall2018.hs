-- 1. (triples xs ys zs) returns a list that contains all possible 3-tuples of values taken from the three lists.
-- Examples: triples [0,1] [2,3] [4,5] returns [(0,2,4),(0,2,5),(0,3,4),(0,3,5),(1,2,4),(1,2,5),(1,3,4),(1,3,5)].
-- Also, triples "ab" "cd" "ef" returns
-- [('a','c','e'),('a','c','f'),('a','d','e'),('a','d','f'),('b','c','e'),('b','c','f'),('b','d','e'),('b','d','f')]. [20 points]
-- triples :: ________________________________________

triples::[a] -> [b] -> [c] -> [(a, b, c)]

triples xs ys zs = [ (x, y, z) | x <- xs, y <- ys, z <-zs ].

-- 2. (pythagoras n) returns a list of all Pythagorean triples with hypotenuse length ≤ n. (Think right
-- triangles.) Example: pythagoras 15 returns [(3,4,5),(5,12,13),(6,8,10),(9,12,15)]. [20 points]
-- pythagoras :: ________________________________________

pythagoras:: Integer -> [(Integer, Integer, Integer)]

pythagoras n = [ (z, y, x) | x <- [0..n], y <- [0..x], z <- [0..y], x/=y, x/=z, y/=z, (x*x == (y*y)+(z*z))]

-- 3. (combine f g m) takes a matrix m represented as a list of lists, uses binary function g to combine
-- the elements of each row, and then uses binary function f to combine those results. Examples:
-- If m1 = [[1,2,3],[4,5,6],[7,8,9]] and m2 = [[False,True],[True,False]] then:
-- combine (+) (*) m1 returns (1*2*3) + (4*5*6) + (7*8*9) = 630.
-- combine (*) (+) m1 returns (1+2+3) * (4+5+6) * (7+8+9) = 2160.
-- combine min max m1 returns 3, and combine max min m1 returns 7.
-- combine (&&) (||) m2 returns True, and combine (||) (&&) m2 returns False. [20 points]
-- combine :: ________________________________________

combine f g ((m:ms):mss) = foldl f (foldl g m ms) mss

-- 

combine f g mss = foldl f  [ foldl g (head ms) (tail ms) | ms <- mss]

--

doG g ms = foldl g (head ms) (tail ms)

combine f g (m:[]) = doG g m
combine f g (m:ms) = f (doG g m) (combine f g ms)


-- 4. (mix f g m) takes a matrix m represented as a list of lists, applies function f to each
-- column, and then applies function g to those results. Examples:
-- mix sum product [[1,2,3],[4,5,6],[7,8,9]] returns (1+4+7) * (2+5+8) * (3+6+9) = 3240.
-- mix product sum [[1,2,3],[4,5,6],[7,8,9]] returns (1*4*7) + (2*5*8) + (3*6*9) = 270.
-- mix id concat ["Roll","Tide","Bama"] = "RTB" ++ "oia" ++ "ldm" ++ "lea" = "RTBoialdmlea".
-- [20 points]
-- mix :: ________________________________________

mix f g (m:[]) = f m
mix f g ms = g (f (map head ms)) (mix f g (map tail ms))

--

mix f g ms = g (map f (transpose ms))

transpose ([]:_) = []
transpose ms = (map head ms) : transpose (map tail ms) 
 
-- 5. (diffproduct xs) returns the product of all the differences between elements in the list xs, with
-- each element that appears later in the list subtracted from each element that appears earlier.
-- So, difflist [x1, …, xn] returns Π j<k (xj - xk). Example: diffproduct [7, 13, 3] returns -240,
-- because (7-13) * (7-3) * (13-3) = -240. [20 points]
-- diffproduct :: ______________________________

diffproduct(x:x1:[]) = x-x1
diffproduct (x:xs) = (product (map (\a -> x - a) xs)) * diffproduct xs

-- 6. (harmonic j) is an infinite list whose terms are finite partial sums of the infinite sequence
-- [1/j, 1/(j+1), 1/(j+2), …]. Example: take 6 (harmonic 1) = [1/1, 1/1 + 1/2, 1/1 + 1/2 + 1/3,
-- 1/1 + 1/2 + 1/3 + 1/4, 1/1 + 1/2 + 1/3 + 1/4 + 1/5, 1/1 + 1/2 + 1/3 + 1/4 + 1/5 + 1/6] =
-- [1.0, 1.5, 1.833333, 2.083333, 2.283333, 2.45]. [10 points]
-- harmonic :: ______________________________

harmonic j = map (\x -> sum (map (\y -> j / y) [1..x]) ) [1..]

-- For the remaining problems, assume that datatype Tree and trees t1, t2 are defined as follows:
-- data Tree a = Node a [Tree a]
-- t1 = Node 6 [Node 2 [Node 1 [ ], Node 4 [Node 3 [ ], Node 5 [ ]]], Node 8 [Node 7 [ ], Node 9 [ ]]]
-- t2 = Node ‘A’ [Node ‘B’ [Node ‘E’ [ ]], Node ‘C’ [Node ‘F’ [ ], Node ‘G’ [ ]], Node ‘D’ [Node ‘H’ [ ]]]



-- 7. (countNodes t) returns the number of nodes in tree t. Examples: (countNodes t1)
-- returns 9, and (countNodes t2) returns 8. [10 points]
-- countNodes :: ______________________________

countNodes t = 

-- 8. (isComplete t) returns True if every leaf of the tree is at the same depth, and otherwise it
-- returns False. Examples: (isComplete t1) returns False, and (isComplete t2) returns True.
-- [20 points]
-- isComplete :: ______________________________