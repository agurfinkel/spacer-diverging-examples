;; This example tries to distill the essence of the array_zero-example.
;; It seems that PDR is not good at reasoning about the fact that a certain event happens on any path leading to some location (e.g. the array at a certain position ;; is set to a value).

;; the horn clauses model the following program:
;; bool flag = false;
;; unsigned i = 0;
;; while(i < n)
;; {
;;     if(i == m)
;;     {
;;         flag = true;
;;     }
;;     i = i+1;
;; }
;; assert(m < n => flag == true)

(declare-rel L1 (Bool Int Int Int))
(declare-rel Error () )

(declare-var b Bool) ;; the flag
(declare-var i Int)
(declare-var n Int)
(declare-var m Int)

(rule (L1 false 0 n m))

(rule (=> 	(and 
				(L1 b i n m) 
			   	(< i n)
			   	(i = m)
		  	)
          	(L1 true (+ i 1) n m)))

(rule (=> 	(and 
			   	(L1 b i n m) 
			   	(< i n)
			   	(not (i = m))
		  	)
          	(L1 b (+ i 1) n m)))

(rule (=> 	(and 
				(L1 i n A) 
				(not (< i n))
				(< m n)
				(b = true)
			)
         	Error))

(query Error)
