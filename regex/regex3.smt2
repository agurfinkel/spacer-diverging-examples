;; cleaned up version of regex2

;; n <= 0 implies G(n, 0) 
;; G(n, c) implies G(n+1, c + n)

;; n <= 0 implies F(n, s, s)
;; F(n, s, r) implies F(n + 1, s - n, r)

;; goal: show that G(n, c) and F(n,0,r) implies c=r
;; mutual induction can use the I.H. r - s = c and afterwards conclude from s=0 that r=c.

;; diverging command line
;z3 -v:1 -st fixedpoint.print_statistics=true fixedpoint.xform.slice=false fixedpoint.xform.inline_linear=false fixedpoint.xform.inline_eager=false fixedpoint.xform.tail_simplifier_pve=false fixedpoint.engine=spacer  fixedpoint.pdr.validate_result=true fixedpoint.spacer.eq_prop=false  regex2.smt2
;; converging command line
;z3 -v:1 -st fixedpoint.print_statistics=true fixedpoint.xform.slice=false fixedpoint.xform.inline_linear=false fixedpoint.xform.inline_eager=false fixedpoint.xform.tail_simplifier_pve=false fixedpoint.engine=spacer  fixedpoint.pdr.validate_result=true fixedpoint.spacer.eq_prop=true  regex2.smt2

(declare-var n Int)
(declare-var c Int)
(declare-var m Int)
(declare-var s Int)
(declare-var r Int)

(declare-rel H (Int Int Int Int Int))
(declare-rel E ())
          
(rule (=> (and 
              (<= n 0) 
              (<= m 0)
          ) 
          (H n 0 m s s)
      )
)

(rule (=> 
          (H n c m s r)
          (H (+ n 1) (+ c n) (+ m 1) (- s m) r)
      )
)

(rule (=> (and 
          (H n c n 0 r)
          (not (= c r))
          ) E))
(query E)
