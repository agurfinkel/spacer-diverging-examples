# README #

Diverging examples

array: STATUS: found and documented problem, not sure how to solve the problem in a general way.

aws: STATUS: didn’t work at this example yet
on the one hand, the algorithm should introduce a quantifier. on the other hand this example (i think it was this example) shows that it isn’t always the best thing to get small lemmas, where smallest means simplest boolean structure. instead of having a single halfspace with many terms it is better to have a disjunction of equalities.

esop: STATUS: already done some work, but need to look at completely_rewritten example and figure out the reason for divergence there

gcnr: STATUS: didn’t work at this example yet
this is one of the examples from the SVComp, the one with three branches in the loop, where one is unreach.

incr: STATUS: need to rerun in Release-Mode, since there are assertion-violations in Debug-Mode

mbqi: STATUS: not directly related, should ignore example for now

qi_slow: STATUS: not directly related, should ignore example for now

regex: STATUS: found and documented problem, minimal-unsat-core idea for LRA/LIA should help

ticket: STATUS: already terminates
