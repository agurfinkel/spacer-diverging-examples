;; differencial privacy example from Aws
;; should be similar to regression verification

;; Expected lemmas are of the form (=> (= a b) (= c d))
;; But spacer finds lemmas of the form (>= (+ a (- b) c (- d) 2))
(declare-var |i_sum:1#|  Int)
(declare-var |i_kp_unk:0#|  Int)
(declare-var |i_N:0#|  Int)
(declare-var |a_q:0#|  (Array Int Int))
(declare-var |i_i:1#|  Int)
(declare-var |i_k_unk:0#|  Int)
(declare-var |i_ind:0#|  Int)
(declare-var |i_ind2:0#|  Int)
(declare-var |b_couple_unk:0#|  Bool)
(declare-var |i_sum:1|  Int)
(declare-var |r_VE:0|  Real)
(declare-var |b_error:1|  Bool)
(declare-var |i_kp_unk:0|  Int)
(declare-var |r_counter:0|  Real)
(declare-var |r_epsilon:0|  Real)
(declare-var |i_N:0|  Int)
(declare-var |a_q:0|  (Array Int Int))
(declare-var |i_i:1|  Int)
(declare-var |i_k_unk:0|  Int)
(declare-var |i_ind:0|  Int)
(declare-var |i_ind2:0|  Int)
(declare-var |b_couple_unk:0|  Bool)
(declare-var |b_error:0|  Bool)
(declare-var |i_sum:2#|  Int)
(declare-var |i_i:2#|  Int)
(declare-var |i_sum:2|  Int)
(declare-var |b_error:2|  Bool)
(declare-var |r_counter:1|  Real)
(declare-var |i_i:2|  Int)
(declare-var r_ex_upper_1  Real)
(declare-var |b_error:3|  Bool)
(declare-rel inv (Bool Int Int Int Int (Array Int Int) Int Real Real Int Bool Real Int Bool Int Int Int Int (Array Int Int) Int Int Int))
(declare-rel error (Bool Int Int Int Int (Array Int Int) Int Real Real Int Bool Real Int Bool Int Int Int Int (Array Int Int) Int Int Int))
(rule (let ((a!1 (forall ((|i_ind:0| Int))
             (and (<= (select |a_q:0#| |i_ind:0|) 1)
                  (>= (select |a_q:0#| |i_ind:0|) (- 1)))))
      (a!2 (forall ((|i_ind:0| Int))
             (and (<= (select |a_q:0| |i_ind:0|) 1)
                  (>= (select |a_q:0| |i_ind:0|) (- 1)))))
      (a!3 (forall ((|i_ind:0| Int))
             (let ((a!1 (= (+ (select |a_q:0#| |i_ind:0|)
                              (* (- 1) (select |a_q:0| |i_ind:0|)))
                           0)))
               (or a!1
                   (forall ((|i_ind2:0| Int))
                     (let ((a!1 (= (+ (select |a_q:0#| |i_ind2:0|)
                                      (* (- 1) (select |a_q:0| |i_ind2:0|)))
                                   0)))
                       (or (<= |i_ind2:0| |i_ind:0|) a!1)))))))
      (a!4 (or |b_error:0|
               (= (not (<= |i_N:0| |i_i:1|)) (<= |i_N:0#| |i_i:1#|)))))
  (=> (and a!1
           a!2
           a!3
           (= |i_N:0| |i_N:0#|)
           (= |i_i:1| 0)
           (= |i_i:1#| 0)
           (= |i_sum:1| 0)
           (= |i_sum:1#| 0)
           (= |b_error:1| a!4)
           (not |b_error:0|)
           (= |r_counter:0| 0.0))
      (inv |b_couple_unk:0|
           |i_ind2:0|
           |i_ind:0|
           |i_k_unk:0|
           |i_i:1|
           |a_q:0|
           |i_N:0|
           |r_epsilon:0|
           |r_counter:0|
           |i_kp_unk:0|
           |b_error:1|
           |r_VE:0|
           |i_sum:1|
           |b_couple_unk:0#|
           |i_ind2:0#|
           |i_ind:0#|
           |i_k_unk:0#|
           |i_i:1#|
           |a_q:0#|
           |i_N:0#|
           |i_kp_unk:0#|
           |i_sum:1#|))))
(rule (let ((a!1 (or |b_error:1|
               (= (not (<= |i_N:0| |i_i:2|)) (<= |i_N:0#| |i_i:2#|)))))
(let ((a!2 (and (not (<= |i_N:0| |i_i:1|))
                (= |i_sum:2| (+ |i_sum:1| (select |a_q:0| |i_i:1|)))
                (= |i_sum:2#| (+ |i_sum:1#| (select |a_q:0#| |i_i:1#|)))
                (= |i_i:2| (+ 1 |i_i:1|))
                (= |i_i:2#| (+ 1 |i_i:1#|))
                (= |r_counter:1| (+ 1.0 |r_counter:0|))
                (= |b_error:2| a!1)
                (inv |b_couple_unk:0|
                     |i_ind2:0|
                     |i_ind:0|
                     |i_k_unk:0|
                     |i_i:1|
                     |a_q:0|
                     |i_N:0|
                     |r_epsilon:0|
                     |r_counter:0|
                     |i_kp_unk:0|
                     |b_error:1|
                     |r_VE:0|
                     |i_sum:1|
                     |b_couple_unk:0#|
                     |i_ind2:0#|
                     |i_ind:0#|
                     |i_k_unk:0#|
                     |i_i:1#|
                     |a_q:0#|
                     |i_N:0#|
                     |i_kp_unk:0#|
                     |i_sum:1#|))))
  (=> a!2
      (inv |b_couple_unk:0|
           |i_ind2:0|
           |i_ind:0|
           |i_k_unk:0|
           |i_i:2|
           |a_q:0|
           |i_N:0|
           |r_epsilon:0|
           |r_counter:1|
           |i_kp_unk:0|
           |b_error:2|
           |r_VE:0|
           |i_sum:2|
           |b_couple_unk:0#|
           |i_ind2:0#|
           |i_ind:0#|
           |i_k_unk:0#|
           |i_i:2#|
           |a_q:0#|
           |i_N:0#|
           |i_kp_unk:0#|
           |i_sum:2#|)))))
(rule (let ((a!1 (not (and true
                     (>= (- |i_sum:2| |i_sum:2#|) (- 2))
                     (>= (- |i_sum:2#| |i_sum:2|) (- 2))))))
(let ((a!2 (and true
                (= |b_error:3| (or |b_error:2| (> |r_counter:1| r_ex_upper_1)))
                (not (< |i_i:2| |i_N:0|))
                a!1
                (inv |b_couple_unk:0|
                     |i_ind2:0|
                     |i_ind:0|
                     |i_k_unk:0|
                     |i_i:1|
                     |a_q:0|
                     |i_N:0|
                     |r_epsilon:0|
                     |r_counter:0|
                     |i_kp_unk:0|
                     |b_error:1|
                     |r_VE:0|
                     |i_sum:1|
                     |b_couple_unk:0#|
                     |i_ind2:0#|
                     |i_ind:0#|
                     |i_k_unk:0#|
                     |i_i:1#|
                     |a_q:0#|
                     |i_N:0#|
                     |i_kp_unk:0#|
                     |i_sum:1#|)
                (inv |b_couple_unk:0|
                     |i_ind2:0|
                     |i_ind:0|
                     |i_k_unk:0|
                     |i_i:2|
                     |a_q:0|
                     |i_N:0|
                     |r_epsilon:0|
                     |r_counter:1|
                     |i_kp_unk:0|
                     |b_error:2|
                     |r_VE:0|
                     |i_sum:2|
                     |b_couple_unk:0#|
                     |i_ind2:0#|
                     |i_ind:0#|
                     |i_k_unk:0#|
                     |i_i:2#|
                     |a_q:0#|
                     |i_N:0#|
                     |i_kp_unk:0#|
                     |i_sum:2#|))))
  (=> a!2
      (error |b_couple_unk:0|
             |i_ind2:0|
             |i_ind:0|
             |i_k_unk:0|
             |i_i:2|
             |a_q:0|
             |i_N:0|
             |r_epsilon:0|
             |r_counter:1|
             |i_kp_unk:0|
             |b_error:2|
             |r_VE:0|
             |i_sum:2|
             |b_couple_unk:0#|
             |i_ind2:0#|
             |i_ind:0#|
             |i_k_unk:0#|
             |i_i:2#|
             |a_q:0#|
             |i_N:0#|
             |i_kp_unk:0#|
             |i_sum:2#|)))))
(query error)
