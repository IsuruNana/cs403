; 1. Draw a diagram that illustrates the internal representation for this S-expression in Scheme:
; ((a) (b c) ( ) (d e f . g))


; 2. Write these five logical functions in Scheme: (not x), (and x y), (or x y), (nand x y), (nor x y).
; Use #t for true and #f for false. Hint: each function can be written very concisely.

(define (not x)
  (if (x)
    #f
    #t
  )
)

(define (and x y)
  (if x
    y
    #f
  )
)

(define (or x y)
  (if x
    x
    y
  )
)

(define (nand x y)
  (not (and x y))
)

; 3. Write a Scheme function (binary_to_decimal m) that converts m from binary to decimal.
; Example: (binary_to_decimal 11010) should return 26.

; (define (b2DH m i v)
;   (if (equal? m 0)
;     v 
;     (if (equal? (modulo m 10) 1
;       (b2DH (modulo m 10) (i+1) (v + (expt 2 i)))  
;     )
;   )
; )

; (define (binary_to_decimal m)
  
; )

; 4. In Scheme an association list is a list of pairs, where each pair has the form (key . data).
; Write a Scheme function (find key association_list) that returns the data associated with the
; given key. If the key is not found, return #f. Examples: (find ’c ’((a . w) (b . x) (c . y) (d . z)))
; returns y, and (find ’e ’((a . w) (b . x) (c . y) (d . z))) returns #f.

(define (find key list)
  (if (null? list)
    #f
    (if (equal? (car (car list)) key)
      (cdr (car list))
      (find key (cdr list))
    )
  )
)

; 5. Write a Scheme function (diagonal M) where M is a square matrix stored as a list of row
; lists. It should return a list of the main diagonal elements of M.
; Example: (diagonal '((a b c d) (e f g h) (i j k l) (m n o p))) returns (a f k p).
; ---    ---\
; \ a b c d \
; \ e f g h \
; \ i j k l \
; \ m n o p \
; \---   ---\ 

; (define (diagonal M)
;   (fold-left (lambda (id x) ()) M M)
; )

(define (diagonal M)
  (if (null? M)
    '()
    (cons (car (car M)) (diagonal (map cdr (cdr M))))
  )
)

; 6. Consider this Scheme expression: (f (g x y) (g x y) (g x y)).

; a. Using let, write an equivalent expression that evaluates subexpression (g x y) only once.

(define (a (g x y))
  (f a a a)
)

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

(define (inner_product X Y f g)
  (if (null? (cdr X))
    (g (car X) (car Y))
    (f (g (car X) (car Y)) (inner_product (cdr X) (cdr Y) f g))
  )
)

; 9. Write (inner_product X Y f g) using map, foldl, foldr, and/or zip. Do not use explicit recursion.

; (define (inner_product X Y f g)
;   (let (comb (zip X Y))
;     (fold-left (lambda (id x) (f id (g (caar comb) (cdr (car comb))))) (g (caar comb) (cdr (car comb))) (cdr comb)) 
;   )
; )

(define (inner_product X Y f g)
  (fold-left f (g (car X) (car Y)) (zipWith g (cdr X) (cdr Y)))
)

; 10. Write the map function in Scheme by using foldr. Do not use explicit recursion.

(define (map2 f L)
  
)


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

(define (applyF2 f x Y)
  (if (null? Y)
    '()
    (cons (f x (car Y)) (applyF2 f x (cdr Y) ))
  )
)

(define (outer_product X Y f)
  (if (null? X)
    '()
    (cons (applyF2 f (car X) Y) (outer_product (cdr X) Y f))
  )
)
; 12. Write (outer_product X Y f) using map, foldl, foldr, and/or zip. Do not use explicit recursion.
; (outer_product '(1 2 3) '(4 5 6 7) *) should return the list ((4 5 6 7) (8 10 12 14) (12 15 18 21)).

; (define (buildList id x)
;   (cons 
;     id 
;     (map (lambda (y) (f x y)) Y)
;   )
; )

(define (outer_product X Y f)
  (fold-left 
    (lambda (id x) 
      (append 
        id 
        (list (map (lambda (y) (f x y)) Y))
      )
    ) 
    '() 
    X
  )
)

(define (outHelp f x Y)
  (map (lambda (y) (f x y)) Y)
)

(define (outer_product X Y f)
  (map (lambda (x) (outHelp f x Y)) X)
)