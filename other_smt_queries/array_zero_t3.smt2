;; for (int i = 0; i < N; i++)
;;    a[i] = 0
;;
;; for (int i = 0; i < N; i++)
;;    assert (a[i] <= 0);

(declare-rel L1 (Int Int (Array Int Int)) )
(declare-rel L2 (Int Int (Array Int Int)) )
(declare-rel M (Int (Array Int Int)))

(declare-rel Error () )

(declare-var i Int)
(declare-var j Int)
(declare-var n Int)
(declare-var A (Array Int Int))
(declare-var B (Array Int Int))

(rule (L1 0 n A))

(rule (=> (and (L1 i n A) )
         (< i n)
         (L1 (+ i 1) n (store A i 0))))


(rule (=> (and (L1 i n A) (not (< i n))) (M n A)))


(rule (=> (and (L2 i n A) (<= (select A i) 0) (< i n)) (L2 (+ i 1) n A)))
(rule (=> (and (M n A) (<= j 0) (not (< j 0))) (L2 j n A)))

(rule (=> (and (L2 i n A) (not (<= (select A i) 0)) (< i n)) Error))

(query Error)
