;;Works
(let ((i 1) (j 2))
  (+ i j)
)

;;Works
(let ((i 1))
  (let ((j (+ i 2)))
    (* i j)
  )
)

;;Error (Needs nested declaration)
(let ((i 1) (j (+ i 2)))
  (* i j)
)

;;Works
(let* ((i 1) (j (+ i 2)))
  (* i j)
)
