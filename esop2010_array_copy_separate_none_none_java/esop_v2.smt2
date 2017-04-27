;; same encoding as esop, but uses quantifier for second loop
;;
;; for (int i = 0; i < N; i++)
;;    B[i] = A[i]
;; 	  i = i+1
;;
;; for (int i = 0; i < N; i++)
;;    assert (B[i] = A[i])

;; Location (i tmp N A B)
(declare-rel L1 (Int Int Int (Array Int Int) (Array Int Int)) )
(declare-rel L2 (Int Int Int (Array Int Int) (Array Int Int)) )

(declare-rel Error () )

(declare-var i Int)
(declare-var tmp Int)
(declare-var N Int)
(declare-var A (Array Int Int))
(declare-var B (Array Int Int))
(declare-var j Int)

(rule (L1 0 tmp N A B))

(rule (=> (and (L1 i tmp N A B) )
         (< i N)
         (L1 (+ i 1) tmp N A (store B i (select A i)))))

(rule (=> (and (L1 i tmp N A B) (not (< i N)))
         (L2 0 tmp N A B)))

(rule (=> (and (L1 i tmp N A B) )
         (< i N)
         (L1 (+ i 1) tmp N A (store B i (select A i)))))

;; here we replace the loop with the second quantifier
(rule (=> (and (L2 i tmp N A B) (<= 0 j) (< j N) (< (select A j) (select B j))) Error))

;;(rule (=> (and (L2 i tmp N A B) (< i N) (> (select A i) (select B i)))
;;		  Error))
;;(rule (=> (and (L2 i tmp N A B) (< i N))
;;	  	  (L2 (+ i 1) tmp N A B)))

(query Error)


