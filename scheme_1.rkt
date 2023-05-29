;Answer to (1)
(define (collatz n) (if (integer? n) (if (> n 0) "Collatz function halts!" "Value must be greater than 0") "variable must be an integer"))

;Answer to (2)
(define (inorder l) (if (= (length l) 3) (let ((temp1 (inorder(car(cdr l)))) ( temp2 (car l)) (temp3 (inorder(car(cdr(cdr l)))))) (set-car! l temp1) (set-car! (cdr l) temp2) (set-car! (cdr (cdr l)) temp3) ) (car l)) car l)

;Answer to (3)
(define (trimming0 l) (if (= 0 (car l)) (set! l (trimming0 (cdr l)))) l)

;Answer to (4)
(define (trimming l) (if (null? l) (write l) (let ((temp (car l))) (set! l (trimming (cdr l))) (if (null? l) (set! l (list temp)) (set! l (append (list temp) l ) ) ) (if (= 0 temp) (set! l (cdr l)) )))l)

