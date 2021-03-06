;; G (g_n, g_r) :- g_n <= 0, g_r = 0
;; G (g_n, g_r) :- G(g_n  -1, c), r = c + n

;; equivalence of G and F via mutual summary H.

;; diverging command line
;z3 -v:1 -st fixedpoint.print_statistics=true fixedpoint.xform.slice=false fixedpoint.xform.inline_linear=false fixedpoint.xform.inline_eager=false fixedpoint.xform.tail_simplifier_pve=false fixedpoint.engine=spacer  fixedpoint.pdr.validate_result=true fixedpoint.spacer.eq_prop=false  regex2.smt2
;; converging command line
;z3 -v:1 -st fixedpoint.print_statistics=true fixedpoint.xform.slice=false fixedpoint.xform.inline_linear=false fixedpoint.xform.inline_eager=false fixedpoint.xform.tail_simplifier_pve=false fixedpoint.engine=spacer  fixedpoint.pdr.validate_result=true fixedpoint.spacer.eq_prop=true  regex2.smt2

(declare-var g_n Int)
(declare-var g_r Int)
(declare-var f_n Int)
(declare-var f_s Int)
(declare-var f_r Int)
(declare-var c Int)
(declare-var v Int)

(declare-rel G (Int Int))
(declare-rel F (Int Int Int))

(declare-rel H (Int Int Int Int Int))
(declare-rel E ())

(rule (=> (<= g_n 0) (G g_n 0)))

(rule (=> (and
           (> g_n 0)
           (G (- g_n 1) c)
           (= g_r (+ c g_n)))
          (G g_n g_r)))

(rule (=> (<= f_n 0) (F f_n f_s f_s)))

(rule (=> (and 
           (> f_n 0)
           (F (- f_n 1) (+ f_n f_s) f_r)
           )
          (F f_n f_s f_r)))
          
;; (rule (=> (<= g_n 0) (H g_n 0 f_n f_s f_r)))
;; (rule (=> (<= f_n 0) (H g_n g_r f_n f_s f_s)))

(rule (=> (and (<= g_n 0) (<= f_n 0)) (H g_n 0 f_n f_s f_s)))
(rule (=> 
       (and 
        ;(= g_n f_n)
        (and
         (> g_n 0)
         (G (- g_n 1) c)
         (= g_r (+ c g_n)))
        
        (and 
         (> f_n 0)
         (F (- f_n 1) (+ f_n f_s) f_r)
         )
        (H (- g_n 1) c (- f_n 1) (+ f_n f_s) f_r)
        )
       (H g_n g_r f_n f_s f_r)))

;; (rule (=> (=> (= g_n f_n) (= (+ g_r f_s) f_r))
;;           (H g_n g_r f_n f_s f_r)))

;(rule (=> (and (G v g_r) (F v 0 f_r) (not (= g_r f_r))) E))
(rule (=> (and 
          (H v g_r v 0 f_r)
          ;;(G v g_r) (F v 0 f_r) 
          (not (= g_r f_r))
          ) E))
(query E)
