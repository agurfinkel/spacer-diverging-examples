;Number of predicates (nodes) = 14
;Number of variables = 7
;Number of clauses = 17
;
(set-logic HORN)
(declare-fun assign_27_5_156 ((Array Int Int) (Array Int Int) Int Int Int Int Int ) Bool)
(declare-fun assert_26_5_147 ((Array Int Int) (Array Int Int) Int Int Int Int Int ) Bool)
(declare-fun assign_25_5_137 ((Array Int Int) (Array Int Int) Int Int Int Int Int ) Bool)
(declare-fun assign_24_5_127 ((Array Int Int) (Array Int Int) Int Int Int Int Int ) Bool)
(declare-fun while_23_1_159 ((Array Int Int) (Array Int Int) Int Int Int Int Int ) Bool)
(declare-fun assign_22_1_109 ((Array Int Int) (Array Int Int) Int Int Int Int Int ) Bool)
(declare-fun assign_19_5_100 ((Array Int Int) (Array Int Int) Int Int Int Int Int ) Bool)
(declare-fun arrayassign_18_5_91 ((Array Int Int) (Array Int Int) Int Int Int Int Int ) Bool)
(declare-fun while_17_1_103 ((Array Int Int) (Array Int Int) Int Int Int Int Int ) Bool)
(declare-fun assign_15_1_69 ((Array Int Int) (Array Int Int) Int Int Int Int Int ) Bool)
(declare-fun assign_13_1_63 ((Array Int Int) (Array Int Int) Int Int Int Int Int ) Bool)
(declare-fun assume_11_1_48 ((Array Int Int) (Array Int Int) Int Int Int Int Int ) Bool)
(declare-fun end ((Array Int Int) (Array Int Int) Int Int Int Int Int ) Bool)
(declare-fun start ((Array Int Int) (Array Int Int) Int Int Int Int Int ) Bool)
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (v Int) (u Int) (numtocopy Int) (size Int) (i Int) ) ( => true (start a_copy  a  v  u  numtocopy  size  i ))))
(assert (forall ((i Int) (size Int) (numtocopy Int) (u Int) (v Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (start a_copy  a  v  u  numtocopy  size  i ) (assume_11_1_48 a_copy  a  v  u  numtocopy  size  i ))))
;
;(assume)  (0<size)
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (v Int) (u Int) (numtocopy Int) (size Int) (i Int) ) ( => ( and (assume_11_1_48 a_copy  a  v  u  numtocopy  size  i ) (< 0 size )) (assign_13_1_63 a_copy  a  v  u  numtocopy  size  i ))))
;
;(assign)  numtocopy := Support.random(0, size)
(assert (forall ((rnd Int) (a_copy (Array Int Int)) (a (Array Int Int)) (v Int) (u Int) (numtocopy Int) (size Int) (i Int) ) ( => ( and (assign_13_1_63 a_copy  a  v  u  numtocopy  size  i ) (>= rnd 0) (< rnd size )) (assign_15_1_69 a_copy  a  v  u  rnd size  i ))))
;
;(assign)  i := 0
(assert (forall ((i Int) (size Int) (numtocopy Int) (u Int) (v Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assign_15_1_69 a_copy  a  v  u  numtocopy  size  i ) (while_17_1_103 a_copy  a  v  u  numtocopy  size  0))))
;
;(while)   while((i<numtocopy))
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (v Int) (u Int) (numtocopy Int) (size Int) (i Int) ) ( => ( and (while_17_1_103 a_copy  a  v  u  numtocopy  size  i ) (< i  numtocopy )) (arrayassign_18_5_91 a_copy  a  v  u  numtocopy  size  i ))))
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (v Int) (u Int) (numtocopy Int) (size Int) (i Int) ) ( => ( and (while_17_1_103 a_copy  a  v  u  numtocopy  size  i ) (not (< i  numtocopy ))) (assign_22_1_109 a_copy  a  v  u  numtocopy  size  i ))))
;
;(aassign) a_copy[i] := a[i]
(assert (forall ((i Int) (size Int) (numtocopy Int) (u Int) (v Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (arrayassign_18_5_91 a_copy  a  v  u  numtocopy  size  i ) (assign_19_5_100 (store a_copy  i  (select a  i )) a  v  u  numtocopy  size  i ))))
;
;(assign)  i := (i+1)
(assert (forall ((i Int) (size Int) (numtocopy Int) (u Int) (v Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assign_19_5_100 a_copy  a  v  u  numtocopy  size  i ) (while_17_1_103 a_copy  a  v  u  numtocopy  size  (+ i  1)))))
;
;(assign)  i := 0
(assert (forall ((i Int) (size Int) (numtocopy Int) (u Int) (v Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assign_22_1_109 a_copy  a  v  u  numtocopy  size  i ) (while_23_1_159 a_copy  a  v  u  numtocopy  size  0))))
;
;(while)   while((i<numtocopy))
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (v Int) (u Int) (numtocopy Int) (size Int) (i Int) ) ( => ( and (while_23_1_159 a_copy  a  v  u  numtocopy  size  i ) (< i  numtocopy )) (assign_24_5_127 a_copy  a  v  u  numtocopy  size  i ))))
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (v Int) (u Int) (numtocopy Int) (size Int) (i Int) ) ( => ( and (while_23_1_159 a_copy  a  v  u  numtocopy  size  i ) (not (< i  numtocopy ))) (end a_copy  a  v  u  numtocopy  size  i ))))
;
;(assign)  u := a_copy[i]
(assert (forall ((i Int) (size Int) (numtocopy Int) (u Int) (v Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assign_24_5_127 a_copy  a  v  u  numtocopy  size  i ) (assign_25_5_137 a_copy  a  v  (select a_copy  i ) numtocopy  size  i ))))
;
;(assign)  v := a[i]
(assert (forall ((i Int) (size Int) (numtocopy Int) (u Int) (v Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assign_25_5_137 a_copy  a  v  u  numtocopy  size  i ) (assert_26_5_147 a_copy  a  (select a  i ) u  numtocopy  size  i ))))
;
;(assert)  (u==v)
(assert (forall ((i Int) (size Int) (numtocopy Int) (u Int) (v Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assert_26_5_147 a_copy  a  v  u  numtocopy  size  i ) (= u  v ))))
(assert (forall ((i Int) (size Int) (numtocopy Int) (u Int) (v Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assert_26_5_147 a_copy  a  v  u  numtocopy  size  i ) (assign_27_5_156 a_copy  a  v  u  numtocopy  size  i ))))
;
;(assign)  i := (i+1)
(assert (forall ((i Int) (size Int) (numtocopy Int) (u Int) (v Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (assign_27_5_156 a_copy  a  v  u  numtocopy  size  i ) (while_23_1_159 a_copy  a  v  u  numtocopy  size  (+ i  1)))))
(check-sat)
