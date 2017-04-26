;; diverges with mbqi underlying problem is a combination of two
;; things. First, mbqi assumes it can adapt a partial model to fit the
;; quantifiers. Second, theory of arrays produces complete models
;; whenever the input contains a store expression.

;; The example works when the complete model happens to be the right
;; one, or store is expanded into a quantified formula.
;;
;; see mbqi_diverge for the complete query from which this example is extracted
(declare-fun pc_n () (Array Int Int))
(declare-fun pc () (Array Int Int))
(declare-fun id0 () Int)
(declare-fun a () Bool)
(declare-fun id1 () Int)


;; removing this conditions make z3 return sat
(assert (= (select pc id0) 0))

(assert (= pc_n (store pc id0 1)))
;; replacing store with two constraints below also returns sat
;;(assert (= (select pc_n id0) 1))
;;(assert (forall ((i Int)) (or (= i id0) (= (select pc i) (select pc_n i)))))

(assert (forall ((i Int)) (= (select pc i) 0)))
(assert (=> a (not (<= (select pc_n id1) 0))))
(check-sat a)
(get-model)
(exit)
