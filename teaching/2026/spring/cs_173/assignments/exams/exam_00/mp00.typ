#import "@local/exam:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "mp",
  number: 0,
  version: 0,
  date: datetime(year: 2026, month: 02, day: 23),
  paper_color: "bleached"
)

#let option = box(circle(radius: 3.6pt, stroke: color.off.black + 0.6pt, fill: none))
#let answer = box(circle(radius: 3.6pt, stroke: color.off.black + 0.6pt, fill: color.off.black))

= Answer each of the following questions by marking either True or False but not both. You may assume all of the axioms of Zermelo-Fraenkel set theory.

1. If this sentence is _false,_ then $emptyset$ is empty.

  #option _True_ \
  #option _False_

2. ${{emptyset, {emptyset}}, {emptyset, {emptyset}}}$ is a natural number.

  #option _True_ \
  #option _False_

3. $PP(emptyset)$ is a subset of every set.

  #option _True_ \
  #option _False_

4. $forall x exists y (y in x)$.

  #option _True_ \
  #option _False_

5. $forall x exists y (y subset x)$.

  #option _True_ \
  #option _False_

6. This sentence has no truth value.

  #option _True_ \
  #option _False_

7. $exists x exists y exists z ((x in y) and (y in z) and (z in x))$.

  #option _True_ \
  #option _False_

8. $exists x exists y exists z ((x subset y) and (y subset z) and (z subset x))$.

  #option _True_ \
  #option _False_

9. ${x st exists y (y = {z st exists w (w in x and z in w)})}$ exists.

  #option _True_ \
  #option _False_

10. The sentence given in problem 6 on this page has no truth value.

  #option _True_ \
  #option _False_

#pagebreak()

= The axioms, rules of inference, and theorems of the zeroth-order and first-order logic must be explicitly cited when used.

For any propositions $alpha$, $beta$, $gamma$, prove the statement shown below.
$ alpha or beta, space beta arrow alpha, space alpha arrow gamma proves gamma $

#pagebreak()

// = You may rely on axioms 0 through 6 of set theory and any theorem we have proven in lecture and in problem sets. Logical axioms, rules, and theorems need not be cited.
= The axioms, rules of inference, and theorems of the zeroth-order and first-order logic *need not* be cited. You may assume axioms 0 through 6 of set theory, and you may rely on any theorems proven in lectures, notes, and problem sets.

Show that $forall x forall y (x inter y = emptyset implies x subset x without y)$.

#pagebreak()

= The axioms, rules of inference, and theorems of the zeroth-order and first-order logic *need not* be cited. You may assume axioms 0 through 6 of set theory, and you may rely on any theorems proven in lectures, notes, and problem sets.

Show that $forall x forall y (PP(x) subset PP(y) implies x subset y)$.
