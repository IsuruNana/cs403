-- (1) Write a power function such that (power m n) returns m raised to the power n, where n is non-negative integer.

-- Tests
-- (pow 2 3)
-- (pow 3 4)

-- (2) Write a log function such that (log m q) returns n such that (power m n) returns q.

-- Tests
-- (log 5 125)
-- (log 2 3)

-- (3) Write a comb function such that (comb n k) returns the number of combinations n-choose-k.

-- Tests
-- (comb 10 4)
-- (comb 4 2)


-- (4) Write an insertion_sort function such that (insertion_sort L) returns the elements of L rearranged into ascending order.

-- (5) Write a selection_sort function.

-- (6) Write a merge_sort function.

-- (7) Write a quick_sort function.

-- (8) Write function (member? diff T) that returns true (#t) if x is a key in binary search tree T, and otherwise returns false (#f).

-- (9) Write function (insert x T) that inserts key x into binary search tree T, and returns the resulting modified tree.

-- (10) Write function (remove x T) that removes key x from binary search tree T, and returns the resulting modified tree.

-- (11) Write functions (inorder T) and (preorder T) and (postorder T) for binary search tree T.

-- (12) Write a filter function such that (filter P L) returns the elements in list L for which predicate P yields #t.  Example: (filter (lambda (x) (> x 0)) '(1 -2 3 -4 5 0 8 9)) returns (1 3 5 8 9).

-- (13) Write a reject function such that (reject P L) returns the elements in list L for which predicate P yields #f.  Example: (reject (lambda (x) (> x 0)) '(1 -2 3 -4 5 0 8 9)) returns (-2 -4 0).

-- (14) Write an applyeach function such that (applyeach L1 L2) applies each function in list L1 to the corresponding value in list L2.  Example: (applyeach (list car cdr length null? last) '((1 2) (4 5 6 7) (8 9 10) (11 12) (13 14))) returns (1 (5 6 7) 3 #f 14).

-- (15) Write function (forall P L) which returns #t iff all values in L satisfy predicate P.  Also write function (exists P L) which returns #t iff some value in L satisfies predicate P.

-- (16) Which of the above functions can you implement using recursion?  Which functions can you implement without recursion by using map, foldl, and/or foldr?