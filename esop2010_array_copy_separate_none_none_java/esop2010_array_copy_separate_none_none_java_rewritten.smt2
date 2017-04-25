;Number of predicates (nodes) = 11
;Number of variables = 5
;Number of clauses = 14
;
(set-logic HORN)
(declare-fun P_9 ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun P_8 ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun P_7 ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun P_6 ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun P_5 ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun P_4 ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun P_3 ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun P_2 ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun P_1 ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun end ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(declare-fun start ((Array Int Int) (Array Int Int) Int Int Int ) Bool)
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (tmp Int) (size Int) (i Int) ) ( => true (start a_copy  a  tmp  size  i ))))
(assert (forall ((i Int) (size Int) (tmp Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (start a_copy  a  tmp  size  i ) (P_1 a_copy  a  tmp  size  i ))))
;
;(assign)  i := 0
(assert (forall ((i Int) (size Int) (tmp Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (P_1 a_copy  a  tmp  size  i ) (P_2 a_copy  a  tmp  size  0))))
;
;(while)   while((i<size))
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (tmp Int) (size Int) (i Int) ) ( => ( and (P_2 a_copy  a  tmp  size  i ) (< i  size )) (P_3 a_copy  a  tmp  size  i ))))
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (tmp Int) (size Int) (i Int) ) ( => ( and (P_2 a_copy  a  tmp  size  i ) (not (< i  size ))) (P_5 a_copy  a  tmp  size  i ))))
;
;(aassign) a_copy[i] := a[i]
(assert (forall ((i Int) (size Int) (tmp Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (P_3 a_copy  a  tmp  size  i ) (P_4 (store a_copy  i  (select a  i )) a  tmp  size  i ))))
;
;(assign)  i := (i+1)
(assert (forall ((i Int) (size Int) (tmp Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (P_4 a_copy  a  tmp  size  i ) (P_2 a_copy  a  tmp  size  (+ i  1)))))
;
;(assign)  i := 0
(assert (forall ((i Int) (size Int) (tmp Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (P_5 a_copy  a  tmp  size  i ) (P_6 a_copy  a  tmp  size  0))))
;
;(while)   while((i<size))
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (tmp Int) (size Int) (i Int) ) ( => ( and (P_6 a_copy  a  tmp  size  i ) (< i  size )) (P_7 a_copy  a  tmp  size  i ))))
(assert (forall ((a_copy (Array Int Int)) (a (Array Int Int)) (tmp Int) (size Int) (i Int) ) ( => ( and (P_6 a_copy  a  tmp  size  i ) (not (< i  size ))) (end a_copy  a  tmp  size  i ))))
;
;(assign)  tmp := a[i]
(assert (forall ((i Int) (size Int) (tmp Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (P_7 a_copy  a  tmp  size  i ) (P_8 a_copy  a  (select a  i ) size  i ))))
;
;(assert)  (tmp==a_copy[i])
(assert (forall ((i Int) (size Int) (tmp Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (P_8 a_copy  a  tmp  size  i ) (= tmp  (select a_copy  i )))))
(assert (forall ((i Int) (size Int) (tmp Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (P_8 a_copy  a  tmp  size  i ) (P_9 a_copy  a  tmp  size  i ))))
;
;(assign)  i := (i+1)
(assert (forall ((i Int) (size Int) (tmp Int) (a (Array Int Int)) (a_copy (Array Int Int)) ) ( => (P_9 a_copy  a  tmp  size  i ) (P_6 a_copy  a  tmp  size  (+ i  1)))))
(check-sat)
