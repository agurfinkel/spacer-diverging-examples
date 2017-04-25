;; equivalent, but more compact version of incr_decr1. Also runs into an assertion violation
(declare-var x Int)
(declare-var y Int)
(declare-var z Int)
(declare-var n Int)
(declare-var x1 Int)
(declare-var y1 Int)

(declare-rel IL (Int Int))
(declare-rel DL (Int Int Int))
(declare-rel F (Int Int))
(declare-rel G (Int Int))
(declare-rel E ())

;; incr x from 0 to n; decr y from 2n to n, then assert equivalence of x and y
(rule (=> (> n 0) (IL 0 n)))
(rule (=> (and (IL x n) (< x n)) (IL (+ x 1) n)))
(rule (=> (and (IL x n) (>= x n)) (DL x (* 2 n) n)))
(rule (=> (and (DL x y n) (> y n)) (DL x (- y 1) n)))
(rule (=> (and (DL x y n) (<= y n)) (F x y)))

(rule (=> (= y x) (G x y)))

(rule (=> (and (F x y) (G y z) (not (= x z))) E))

(query E)
