; 1. (fun L) returns the sum of the fourth powers of all the odd positive numbers in the list L.
; Example: (fun '(2 3 -2 6 5 -3)) returns 3^4 + 5^4 = 706.

(define (fun L)
  (if (null? L) 
    0
    (if (and (odd? (car L)) (> (car L) 0))
      (+
        (expt (car L) 4)
        (fun (cdr L))
      )
      (fun (cdr L))
    ) 
  )
)


; 2. (matrix r c x) returns a matrix which is represented as a list of lists. The matrix will have r rows
; and c columns, and will contain elements with successive values x, x+1, x+2, … Example:
; (matrix 3 4 1) returns ((1 2 3 4) (5 6 7 8) (9 10 11 12)). Hint: write a helper function that
; produces one row of the matrix.

(define (make_row num end_num)
  (if (= num (+ end_num 1))
    '()
    (cons 
      num
      (make_row (+ num 1) end_num)
    )
  )
)

(define (row c x) 
  (if (= c 0) 
    '()
    (cons 
      x 
      (row (- c 1) (+ x 1))
    )
  )
) 

; (define (matrix r c x)
;   (let ((col 1))
;     (if (= (* r c) x)
;       '()
;       (cons
;         (make_row x (+ x r))
;         (make_row (+ col 1))
;       )
;     )
;   )
; )


(define (matrix r c x) 
  (if (= r 0) 
    '()
    (cons 
      (row c x) 
      (matrix (- r 1) c (+ x c))
    )
  )
)

; 3. (transpose M) returns the transpose of matrix M, which is represented as a list of lists.
; Example: (transpose ‘((1 2 3) (4 5 6) (7 8 9) (10 11 12))) returns ((1 4 7 10) (2 5 8 11) (3 6 9 12)).
; You are not permitted to use zip for this problem.

;;My solution
(define (row M)
  (if (null? M)
    '()
    (cons
      (car (car M)) 
      (row (cdr M))
    )
  )
)

(define (breakdown M)
  (if (null? M)
    '()
    (cons 
      (cdr (car M))
      (breakdown (cdr M))
    )
  )
)

(define (transpose M)
  (if (null? (car M))
    '()
    (cons 
      (row M)
      (transpose (breakdown M))
    )
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Preferred
(define (transpose M)
 (if (null? (car M)) 
  '()
  (cons 
    (map car M)   
    (transpose (map cdr M))
  )
 )
)

; 4. Scheme provides both let and let* to define local variables, but both can be replaced by lambdas.
; a. First write an expression using lambda that is equivalent to (let ((x1 e1) (x2 e2) … (xn en)) e).
; b. Next write an expression using lambda that is equivalent to (let* ((x1 e1) (x2 e2) … (xn en)) e).

(define letAlt 
  (lambda 
    
  )
)

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


(define (counter)
 (let ((n 0))
    (lambda () 
      (set! n (+ n 1)) n
    )
 )
) 

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

(define (evaluate e)
  (if (integer? e) 
    e
    (let ((x (evaluate (cadr e))) (y (evaluate (caddr e))))
      (if (eq? (car e) 'add) 
        (+ x y)
        (if (eq? (car e) 'sub) 
          (- x y)
          (if (eq? (car e) 'mul) 
            (* x y)
            'error
          )
        )
    )
      )
    )
  )
)

(define (evaluate e)
  (if (integer? e)
    e
    (let ()

    )
  )
)

; CS 503: (evaluate e L) evaluates expression e that will only include operations add, sub, mul,
; integer values, and identifiers. List L contains pairs of identifiers and their integer values.
; Example: (evaluate ‘(mul (add w x) (sub y z)) ‘((w . 3) (x . 4) (y . 8) (z . 2))) returns 7*6 = 42.
