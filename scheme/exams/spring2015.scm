; 1. Draw a diagram that illustrates the internal representation for this S-expression in Scheme:
; ((a) (b c) ( ) (d e f . g))


; 2. Write these five logical functions in Scheme: (not x), (and x y), (or x y), (nand x y), (nor x y).
; Use #t for true and #f for false. Hint: each function can be written very concisely.

(define (not2 x)
  (if x #f #t )
)

(define (and2 x y)
  (if x
    y
    #f
  )
)

(define (or2 x y)
  (if x
    #t
    y
  )
)

(define (nand2 x y)
  (if x
    #f
    (if y
      #f
      #t
    )
  )
)

(define (nor2 x y)
  (if x
    #f
    (if y
      #f
      #t
    )
  )
)


; 3. Write a Scheme function (binary_to_decimal m) that converts m from binary to decimal.
; Example: (binary_to_decimal 11010) should return 26.

(define (binary_to_decimal m)
  
)

; 4. In Scheme an association list is a list of pairs, where each pair has the form (key . data).
; Write a Scheme function (find key association_list) that returns the data associated with the
; given key. If the key is not found, return #f. Examples: (find ’c ’((a . w) (b . x) (c . y) (d . z)))
; returns y, and (find ’e ’((a . w) (b . x) (c . y) (d . z))) returns #f.


; 5. Write a Scheme function (diagonal M) where M is a square matrix stored as a list of row
; lists. It should return a list of the main diagonal elements of M.
; Example: (diagonal '((a b c d) (e f g h) (i j k l) (m n o p))) returns (a f k p).
; ---    ---\
; \ a b c d \
; \ e f g h \
; \ i j k l \
; \ m n o p \
; \---   ---\ 


; 6. Consider this Scheme expression: (f (g x y) (g x y) (g x y)).

; a. Using let, write an equivalent expression that evaluates subexpression (g x y) only once.



; b. Using lambda, write an equivalent expression that evaluates subexpression (g x y) only once.


; 7. Evaluate each of these Scheme expressions. Match up the parentheses carefully!
; a. ((lambda (x) ((lambda (y) ((lambda (z) (* x (- y z))) 5)) 9)) 2) ________
; b. ((lambda (x) (((lambda (y) (lambda (z) (* x (- y z)))) 5) 9)) 2) ________
; c. ((((lambda (x) (lambda (y) (lambda (z) (* x (- y z))))) 5) 9) 2) ________
; d. (((lambda (x) ((lambda (y) (lambda (z) (* x (- y z)))) 5)) 9) 2) ________
; e. (((lambda (x) (lambda (y) ((lambda (z) (* x (- y z))) 5))) 9) 2) ________



; The next two problems ask you to write a Scheme function (inner_product X Y f g) that returns the
; inner product of the lists X and Y with respect to binary operations f and g. You may assume
; that lists X and Y are nonempty lists of the same length, and that operation f is associative and
; commutative. Example: (inner_product '(1 2 3) '(4 5 6) + *) returns 32, because 1*4+2*5+3*6 =
; 32. This kind of inner product is sometimes also called a dot product. Another example:
; (inner_product '(1 2 3) '(4 5 6) * +) returns 315, because (1+4)*(2+5)*(3+6) = 315.
; 8. Write (inner_product X Y f g) using recursion. Do not use map, foldl, foldr, or zip.




; 9. Write (inner_product X Y f g) using map, foldl, foldr, and/or zip. Do not use explicit recursion.

; 10. Write the map function in Scheme by using foldr. Do not use explicit recursion.



; The next two problems ask you to write a Scheme function (outer_product X Y f) that returns the
; outer product of the lists X and Y with respect to binary operation f. The result is a list of length
; |X|, each of whose members is a sublist of length |Y|. The kth element of the j
; th sublist is
; obtained by applying operation f to the j
; th element of X and the kth element of Y. Example:
; (outer_product '(1 2 3) '(4 5 6 7) *) should return the list ((4 5 6 7) (8 10 12 14) (12 15 18 21)).
; This kind of outer product is sometimes also called a multiplication table. Hint: Also write a
; helper function that constructs one of the sublists.


; 11. Write (outer_product X Y f) using recursion. Do not use map, foldl, foldr, or zip.


; 12. Write (outer_product X Y f) using map, foldl, foldr, and/or zip. Do not use explicit recursion.