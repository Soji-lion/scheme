; Answer to (1)
(define (deletedup l) (if (not (null? l)) (let ((temp1 (car (rev l))) (temp2 (rev (cdr (rev l))))) (set! l (deletedup temp2)) (if (null? temp2) (set! l temp1) (if (not (= (find temp1 temp2) 1)) (if (list? l) (set! l (append l (list temp1))) (set! l (append (list l) (list temp1) )))) ) )) l)
;Helper functions for question 1
;find: returns 1 if item is in lst or 0 otherwise
(define (find item lst) (let ((temp 0)) (if (not (null? lst)) (if (= item (car lst)) (set! temp 1) (set! temp (find item (cdr lst)))) ) temp))
;rev: reverses the list
(define (rev l) (if (not (null? l)) (let ((temp (car l))) (set! l (rev (cdr l))) (if (null? l) (set! l (list temp)) (begin (if (null? (cdr l)) (set-cdr! l (list temp)) (begin (set! l (append l (list temp)))) )))))l)

; Answer to (2)
(define (dreverse l)  (if (not (null? l))  (if (not (list? l)) l (begin (let ((temp1 (dreverse (car l)) ))  (set-car! l temp1) (set! temp1 (dreverseCdr (cdr l))) (set-cdr! l temp1) (if (list? l) (set! l (rev l)))  )  ))) l)
(define (dreverseCdr l)  (if (not (null? l))  (if (not (list? l)) l (begin (let ((temp1 (dreverse (car l)) ))  (set-car! l temp1) (set! temp1 (dreverseCdr (cdr l))) (set-cdr! l temp1))  ))) l)

;Answer to (3)
(define (preorder l) (if (= (length l) 3) (append (list (car l)) (preorder (car (cdr l))) (preorder (car(cdr(cdr l)))) ) (list (car l)) ))

;Answer to (4)
(define (tcons preor inor) (if (> (length preor) 1 ) (let ((result '())(root (car preor)))
                                                       (let ((rootIndex (index root inor 0)))(set! result (append result (list (car preor))))
                                                         (set! result (append result (list (tcons (rev(cutter (rev (cdr preor)) (- (length (cdr preor)) rootIndex))) (rev(cutter(rev inor)(- (length preor)rootIndex) ))))))
                                                         (set! result (append result (list (tcons (cutter (cdr preor) rootIndex ) (cutter inor (+ rootIndex 1))) )) )result ) ) preor))
;Helper functions for question 4
;index: finds item's position inside lst
(define (index item lst temp) (if (not (null? lst)) (if (eq? item (car lst)) temp (begin (set! temp (+ 1 temp)) (set! temp (index item (cdr lst) temp))) ) temp) temp)
;rev: reverses the list
(define (rev l) (if (not (null? l)) (let ((temp (car l))) (set! l (rev (cdr l))) (if (null? l) (set! l (list temp)) (begin (if (null? (cdr l)) (set-cdr! l (list temp)) (begin (set! l (append l (list temp)))) )))))l)
;cutter: removes "times" number of elements from the front of lst  
(define (cutter lst times) (if (< times 1) lst (set! lst (cutter (cdr lst) (- times 1))) )lst)
