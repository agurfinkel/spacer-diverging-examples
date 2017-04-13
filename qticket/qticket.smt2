(declare-var pc (Array Int Int))
(declare-var t (Array Int Int))
(declare-var serving Int)
(declare-var ticket Int)
(declare-var pc_p (Array Int Int))
(declare-var t_p (Array Int Int))
(declare-var serving_p Int)
(declare-var ticket_p Int)
(declare-var id0 Int)
(declare-var id1 Int)
(declare-rel Inv ((Array Int Int) (Array Int Int) Int Int))
(declare-rel Error ())
(rule
 (!
  (=> (and
      (forall ((z1 Int)) (= (select pc z1) 0))
      (forall ((z1 Int)) (> (select t z1) 0))
      (= ticket 0)
      (= serving 0))
     (Inv pc t serving ticket))
  :named init)
 )

(rule (! (=> (and (Inv pc t serving ticket)
         (= (select pc id0) 0)
         (= pc_p (store pc id0 1))
         (= t_p (store t id0 ticket))
         (= ticket_p (+ ticket 1)))
    (Inv pc_p t_p serving ticket_p)) :named tr1))
(rule (! (=> (and (Inv pc t serving ticket)
         (= (select pc id0) 1)
         (= (select t id0) serving)
         (= pc_p (store pc id0 2)))
    (Inv pc_p t serving ticket)) :named tr2))
(rule (! (let ((a!1 (and (Inv pc t serving ticket)
                (= (select pc id0) 2)
                (= pc_p (store pc id0 0))
                (= serving_p (+ (select t id0) 1)))))
  (=> a!1 (Inv pc_p t serving_p ticket))) :named tr3))
(rule (! (=> (and (Inv pc t serving ticket)
         (distinct id0 id1)
         (= (select pc id0) 2)
         (= (select pc id1) 2))
    Error) :named bad))
(query Error)

