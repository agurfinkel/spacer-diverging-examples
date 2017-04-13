;Number of predicates (nodes) = 11
;Number of variables = 5
;Number of clauses = 14
;
(set-logic HORN)
(declare-fun assign_19_5_118 ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun assert_18_5_109 ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun assign_17_12_95 ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun while_16_1_121 ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun assign_15_1_77 ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun assign_12_5_68 ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun arrayassign_11_5_59 ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun while_10_1_71 ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun assign_9_1_37 ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun end ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun start ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (tmp Int) (size Int) (i Int) ) ( => true (start a_copy  a  tmp  size  i ))))
(assert (forall ((i Int) (size Int) (tmp Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (start a_copy  a  tmp  size  i ) (assign_9_1_37 a_copy  a  tmp  size  i ))))
;
;(assign)  i := 0
(assert (forall ((i Int) (size Int) (tmp Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assign_9_1_37 a_copy  a  tmp  size  i ) (while_10_1_71 a_copy  a  tmp  size  0))))
;
;(while)   while((i<size))
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (tmp Int) (size Int) (i Int) ) ( => ( and (while_10_1_71 a_copy  a  tmp  size  i ) (< i  size )) (arrayassign_11_5_59 a_copy  a  tmp  size  i ))))
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (tmp Int) (size Int) (i Int) ) ( => ( and (while_10_1_71 a_copy  a  tmp  size  i ) (not (< i  size ))) (assign_15_1_77 a_copy  a  tmp  size  i ))))
;
;(aassign) a_copy[i] := a[i]
(assert (forall ((i Int) (size Int) (tmp Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (arrayassign_11_5_59 a_copy  a  tmp  size  i ) (assign_12_5_68 (store a_copy  i  (select a  i )) a  tmp  size  i ))))
;
;(assign)  i := (i+1)
(assert (forall ((i Int) (size Int) (tmp Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assign_12_5_68 a_copy  a  tmp  size  i ) (while_10_1_71 a_copy  a  tmp  size  (+ i  1)))))
;
;(assign)  i := 0
(assert (forall ((i Int) (size Int) (tmp Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assign_15_1_77 a_copy  a  tmp  size  i ) (while_16_1_121 a_copy  a  tmp  size  0))))
;
;(while)   while((i<size))
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (tmp Int) (size Int) (i Int) ) ( => ( and (while_16_1_121 a_copy  a  tmp  size  i ) (< i  size )) (assign_17_12_95 a_copy  a  tmp  size  i ))))
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (tmp Int) (size Int) (i Int) ) ( => ( and (while_16_1_121 a_copy  a  tmp  size  i ) (not (< i  size ))) (end a_copy  a  tmp  size  i ))))
;
;(assign)  tmp := a[i]
(assert (forall ((i Int) (size Int) (tmp Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assign_17_12_95 a_copy  a  tmp  size  i ) (assert_18_5_109 a_copy  a  (select a  i ) size  i ))))
;
;(assert)  (tmp==a_copy[i])
(assert (forall ((i Int) (size Int) (tmp Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assert_18_5_109 a_copy  a  tmp  size  i ) (= tmp  (select a_copy  i )))))
(assert (forall ((i Int) (size Int) (tmp Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assert_18_5_109 a_copy  a  tmp  size  i ) (assign_19_5_118 a_copy  a  tmp  size  i ))))
;
;(assign)  i := (i+1)
(assert (forall ((i Int) (size Int) (tmp Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assign_19_5_118 a_copy  a  tmp  size  i ) (while_16_1_121 a_copy  a  tmp  size  (+ i  1)))))
(check-sat)
