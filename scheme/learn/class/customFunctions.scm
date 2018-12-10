;;Custom length function
(define (len L) 
  (if (null? L) 
      0
      (+ 1 (len (cdr L)))
  )
)

;;Custom append function
(define (app L1 L2)
  (if (null? L1) 
      L2    
      (cons (car L1) (app (cdr L1) L2))
  )
)

;;Custom reverse function
(define (rev L)
  (if (null? L) 
    '()                  ;;Need to pass a list to append
    (append (rev (cdr L)) (cons (car L) '()))
  )
)

;;Custom count function (only numbers)
(define (count x L)
  (if (null? L) 
      0
      (if (= (car L) x) 
          (+ 1 (count x (cdr L)))
          (count x (cdr L))
      )
  )
)

;;Custom count function (letters + numbers)
(define (countall x L)
  (if (null? L) 
    0
    (if (pair? L)
      (+ 
        (countall x (car L)) 
        (countall x (cdr L))
      )
      (if (eq? x L)
        1
        0
      )
    )
  )
)

;;Custom equal function
(define (equ? L1 L2)
  (if (and (pair? L1) (pair? L2))
    ;;Continuing to recurse on the cdr call
    (and (equ? (car L1) (car L2)) (equ? (cdr L1) (cdr L2))) 
    ;;Case for checking car recursive call. (Base case)  
    (eq? L1 L2)
  )
)

;;Custom flatten function
(define (flatten L)
  (if (pair? L)
    ;;Can call car and cdr safely in recursive call
    (append 
      (flatten (car L)) 
      (flatten (cdr L))
    )
    (if (null? L)
      ;;Base case. At closing brace
      L
      ;;L is not a list so return it as a list
      (cons L '())
    )
  )
)

(define (flatten2 L)
  (if (null? L)
    '()
    (if (not (pair? L))
      (list L)
      (append (flatten (car L)) (flatten (cdr L)))
    )
  )
)

;;Custom filter function
(define (filt f L)
  (if (null? L)
    L
    (if (f (car L))
      (cons (car L) (filt f (cdr L)))
      (filt f (cdr L))
    )
  )
)

;;Custom reject(inverse filter) function
(define (reject f L)
  (if (null? L)
    L
    (if (f (car L))
      (reject f (cdr L))
      (cons (car L) (reject f (cdr L)))
    )
  )
)

;;Custom fold-left
(define (foldL f id L)
  (if (null? L) 
    id
    (foldL f (f id (carL)) (cdr L))
  )
)

;;Custom fold-right
(define (foldR f id L)
  (if (null? L) 
    id
    (f (car L) (foldR f id (cdr L)))
  )
)

;;Custom zip
(define (z L1 L2)
  (if (or (null? L1) (null? L2))
    '()
    (cons 
      (list (car L1) (car L2))
      (z (cdr L1) (cdr L2))
    )
  )
)

;;Custom zipwith
(define (zipwith f L1 L2)
  (if (or (null? L1) (null? L2))
    '()
    (cons 
      (f (car L1) (car L2))
      (zipwith f (cdr L1) (cdr L2))
    )
  )
)