;Number of predicates (nodes) = 10
;Number of variables = 4
;Number of clauses = 13
;
(set-logic HORN)
(declare-fun assign_18_5_110 ((Array Int Int) (Array Int Int) Int Int ) Bool)
(declare-fun assert_17_5_101 ((Array Int Int) (Array Int Int) Int Int ) Bool)
(declare-fun while_16_1_113 ((Array Int Int) (Array Int Int) Int Int ) Bool)
(declare-fun assign_15_1_75 ((Array Int Int) (Array Int Int) Int Int ) Bool)
(declare-fun assign_12_5_66 ((Array Int Int) (Array Int Int) Int Int ) Bool)
(declare-fun arrayassign_11_5_57 ((Array Int Int) (Array Int Int) Int Int ) Bool)
(declare-fun while_10_1_69 ((Array Int Int) (Array Int Int) Int Int ) Bool)
(declare-fun assign_9_1_35 ((Array Int Int) (Array Int Int) Int Int ) Bool)
(declare-fun end ((Array Int Int) (Array Int Int) Int Int ) Bool)
(declare-fun start ((Array Int Int) (Array Int Int) Int Int ) Bool)
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (size Int) (i Int) ) ( => true (start a_copy  a  size  i ))))
(assert (forall ((i Int) (size Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (start a_copy  a  size  i ) (assign_9_1_35 a_copy  a  size  i ))))
;
;(assign)  i := 0
(assert (forall ((i Int) (size Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assign_9_1_35 a_copy  a  size  i ) (while_10_1_69 a_copy  a  size  0))))
;
;(while)   while((i<size))
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (size Int) (i Int) ) ( => ( and (while_10_1_69 a_copy  a  size  i ) (< i  size )) (arrayassign_11_5_57 a_copy  a  size  i ))))
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (size Int) (i Int) ) ( => ( and (while_10_1_69 a_copy  a  size  i ) (not (< i  size ))) (assign_15_1_75 a_copy  a  size  i ))))
;
;(aassign) a_copy[i] := a[i]
(assert (forall ((i Int) (size Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (arrayassign_11_5_57 a_copy  a  size  i ) (assign_12_5_66 (store a_copy  i  (select a  i )) a  size  i ))))
;
;(assign)  i := (i+1)
(assert (forall ((i Int) (size Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assign_12_5_66 a_copy  a  size  i ) (while_10_1_69 a_copy  a  size  (+ i  1)))))
;
;(assign)  i := 0
(assert (forall ((i Int) (size Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assign_15_1_75 a_copy  a  size  i ) (while_16_1_113 a_copy  a  size  0))))
;
;(while)   while((i<size))
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (size Int) (i Int) ) ( => ( and (while_16_1_113 a_copy  a  size  i ) (< i  size )) (assert_17_5_101 a_copy  a  size  i ))))
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (size Int) (i Int) ) ( => ( and (while_16_1_113 a_copy  a  size  i ) (not (< i  size ))) (end a_copy  a  size  i ))))
;
;(assert)  (a[i]==a_copy[i])
(assert (forall ((i Int) (size Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assert_17_5_101 a_copy  a  size  i ) (= (select a  i ) (select a_copy  i )))))
(assert (forall ((i Int) (size Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assert_17_5_101 a_copy  a  size  i ) (assign_18_5_110 a_copy  a  size  i ))))
;
;(assign)  i := (i+1)
(assert (forall ((i Int) (size Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assign_18_5_110 a_copy  a  size  i ) (while_16_1_113 a_copy  a  size  (+ i  1)))))
(check-sat)
