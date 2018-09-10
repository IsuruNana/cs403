; 1. (sequence s f n) returns a list of length n that starts with s, such that each successive value
; is obtained by applying function f to its predecessor. Examples:
; (sequence 2 square 5) returns (2 4 16 256 65536).
; (sequence 3 (lambda (x) (+ x 10)) 8) returns (3 13 23 33 43 53 63 73).
; (sequence 5 (lambda (x) (* x 2)) 7) returns (5 10 20 40 80 160 320).

(define (sequence s f n) 
  (if (= n 0)
    '()
    (cons
      s
      (sequence (f s) f (- n 1))
    )
  )
)


; 2. (twist L) reverses the top level of list L, and recursively twists every nested sublist. Example:
; (twist '(1 2 (a b) (3 (4 c) d) ((e f) (5 6)) g 7)) returns (7 g ((6 5) (f e)) (d (c 4) 3) (b a) 2 1).

(define (twist L)
  (if (not (pair? L))
    L
    (map twist (reverse L))
  )
)

; 3. (countall L) counts the total number of values within all nested levels of L that are neither
; pairs nor null. Example: (countall '(a b (c ( ) (d)) ((5 (10) ((15)) ( )) #t))) returns 8.

(define (countall L)
 (if (null? L) 
  0
  (if (not (pair? L)) 
    1
    (+ 
      (countall (car L)) 
      (countall (cdr L))
    )
  )
 )
)

; 4. (mapall f L) applies the function f to all values within all nested levels of L that are neither
; pairs nor null. Example: (mapall square '(2 3 (4 ( ) (5)) ((6 (7) ((8)) ( )) 9))) returns
; (4 9 (16 ( ) (25)) ((36 (49) ((64)) ( )) 81)).


(define (mapall f L)
  (if (null? L)
    L
    (if (not (pair? L))
      (f L)
      (cons
        (mapall f (car L))
        (mapall f (cdr L))
      )
    )
  )
)

; 5. (mysqrt n) returns the truncated square root of non-negative integer n. Do not use the built-in
; “sqrt” function. Example: (mysqrt 31) returns 5 because 5 ≤ √31 < 6. For maximum credit,
; your function should be efficient. Hint: Use a helper function that does binary search in the
; range 0 to n. Alternatively, for most of the credit, use a less efficient linear search

(define (b_search start end n)
  (let ((mid (quotient (+ start end) 2)))
    (if (> (square mid) n)
      (b_search start (- end 1) n)
      (if (<= (square (+ mid 1)) n)
        (b_search n (+ mid 1) b)
        mid
      )
    )
  )
)

(define (mysqrt n) 
  (b_search 0 n n)
)

; 6. (prime? n) returns #t iff the integer n is prime. Example: (prime? 60) returns #f, and
; (prime? 61) returns #t. For maximum credit, your function should be efficient. Hint:
; Use a helper function that checks possible factors of n in the range 2 to √n.

(define (check_factors check n)
  (if (= check n)
    #t
    (and
      (= (modulo n check) 0)
      (check_factors (+ 1 check) n)
    )
  )
)

(define (check_factors check n)
  (if (= (modulo n check) 0)
    #f
    (if (= check n)
      #t
      (check_factors (+ 1 check) n)
    )
  )
)

(define (prime? n)
  (and
    (>= n 2)
    (check_factors 2 (mysqrt n))
  )
)

; 7. (factorize n) returns a list of all the prime factors whose product yields the non-negative
; integer n. Example: (factorize 360) returns (2 2 2 3 3 5), and (factorize 361) returns (19 19).
; For maximum credit, your function should be efficient. Hint: Use a helper function that
; checks possible factors of n in the range 2 to √n.

(define (fact_finder n divisor)
  (if (> (square divisor) n)
    (list n)
    (if (= (modulo n divisor) 0)
      (cons
        divisor
        (fact_finder (quotient n divisor) divisor)
      )
      (fact_finder n (+ 1 divisor))
    )
  )
)

(define (factorize n)
  (fact_finder n 2)
)


; 8. (powerset S) takes a set S represented as a list, and returns a list of all subsets of S. Example:
; (powerset '(a b c)) returns ((a b c) (a b) (a c) (a) (b c) (b) (c) ( )). However, your function may
; arrange each list in any order because the order of elements within a set does not matter.

(define (powerset S)
  (if (not (pair? S))
    ()
    (cons
      (map car S)
      ()
    )
  )
)

; 9. (forall p a1 a2 … an) and (exists p a1 a2 … an) are variadic functions. (forall p a1 a2 … an) returns #t
; iff every (p ak) returns #t, and (exists p a1 a2 … an) returns #t iff at least one (p ak) returns #t. Do
; not use the built-in “every” or “any” functions. Examples: (forall even? 2 4 6 8) returns #t,
; (forall even? 2 4 5 6 8) returns #f, (exists even? 1 3 4 5 7) returns #t, (exists even? 1 3 5 7)
; returns #f. Hint: You may use the following “and” and “or” helper functions if you wish.
; (define (and x y) (if x y #f))
; (define (or x y) (if x #t y))

(define (forall p L)
  (fold-left
    and
    #t
    (map p L)
  )
)

; 10. In this problem, each set is represented as a predicate rather than as a list of elements.
; Several example functions on such sets are provided below. Also write these additional
; functions: (add e S) adds element e to set S, (remove e S) removes element e from set S,
; (union S T) returns the union of sets S and T, (intersect S T) returns the intersection of sets S
; and T, and (complement S) returns the complement of set S.
; (define (member? x S) (S x))
; (define (nullset) (lambda (x) #f))
; (define (universalset) (lambda (x) #t))
; (define (difference S T) (intersect S (complement T)))