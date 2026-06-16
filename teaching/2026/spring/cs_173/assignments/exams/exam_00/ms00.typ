#import "@local/exam:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "ms",
  number: 0,
  version: 0,
  date: datetime(year: 2026, month: 02, day: 23),
  paper_color: "bleached"
)

#let option = box(circle(radius: 3.6pt, stroke: color.off.black + 0.6pt, fill: none))
#let answer = box(circle(radius: 3.6pt, stroke: color.off.black + 0.6pt, fill: color.off.black))

= Answer each of the following questions by marking either True or False but not both. You may assume all of the axioms of Zermelo-Fraenkel set theory.

1. If this sentence is _false,_ then $emptyset$ is empty.

  #answer _True_ \
  #option _False_

2. ${{emptyset, {emptyset}}, {emptyset, {emptyset}}}$ is a natural number.

  #option _True_ \
  #answer _False_

3. $PP(emptyset)$ is a subset of every set.

  #option _True_ \
  #answer _False_

4. $forall x exists y (y in x)$.

  #option _True_ \
  #answer _False_

5. $forall x exists y (y subset x)$.

  #answer _True_ \
  #option _False_

6. This sentence has no truth value.

  #option _True_ \
  #answer _False_

7. $exists x exists y exists z ((x in y) and (y in z) and (z in x))$.

  #option _True_ \
  #answer _False_

8. $exists x exists y exists z ((x subset y) and (y subset z) and (z subset x))$.

  #answer _True_ \
  #option _False_

9. ${x st exists y (y = {z st exists w (w in x and z in w)})}$ exists.

  #option _True_ \
  #answer _False_

10. The sentence given in problem 6 on this page has no truth value.

  #option _True_ \
  #answer _False_

#pagebreak()

= The axioms, rules of inference, and theorems of the zeroth-order and first-order logic must be explicitly cited when used.

For any propositions $alpha$, $beta$, $gamma$, prove the statement shown below.
$ alpha or beta, space beta arrow alpha, space alpha arrow gamma proves gamma $

#v(1.0cm)

// #proof(number: 1)[
//   Let $alpha$, $beta$, and $gamma$ be propositions.
//   Assume $alpha or beta$, and $beta arrow alpha$, and also $alpha arrow gamma$.
//   #case[
//     Suppose $alpha$.
//     We know $alpha arrow gamma$ by assumption.
//   ]
//   #case[
//     Suppose $beta$.
//     By the _hypothetical syllogism,_ we derive $beta arrow gamma$ from $beta arrow alpha$ and $alpha arrow gamma$.
//     We now get $gamma$ by _modus ponens._
//     Thus, $beta proves gamma$, so $beta arrow gamma$ by the _deduction rule._
//   ]
//   Therefore, by _disjunction elimination,_
//   #marginalis[
//     $x or y, space x arrow z, space y arrow z proves z$
//   ]
//   we conclude $gamma$.
// ]

// #v(1.0fr)

#proof(number: 1)[
  Let $alpha$, $beta$, and $gamma$ be propositions.
  Assume $alpha or beta$, and $beta arrow alpha$, and also $alpha arrow gamma$.
  Towards a contradiction, assume $not gamma$.
  By _modus tollens,_ we obtain $not alpha$.
  By the _modus tollens_ again, we further obtain $not beta$.
  Thus, we can see $not alpha and not beta$ by _conjunction introduction._
  #marginalis[
    $x, space y proves x and y$
  ]
  Now, observe $not alpha and not beta equiv not (alpha or beta)$ by _De Morgan's laws,_
  producing $not (alpha or beta)$ and contradicting our earlier assumption $alpha or beta$.
  #contradiction

  Therefore, we have $gamma$ as desired.
]

#v(1.0fr)

#proof(number: 2)[
  Let $alpha$, $beta$, and $gamma$ be propositions.
  // Assume $alpha or beta$, and $beta arrow alpha$, and also $alpha arrow gamma$.
  Assume $alpha or beta$, and also $beta arrow alpha$, and $alpha arrow gamma$ as well.
  By the _hypothetical syllogism,_
  #marginalis[
    $x arrow y, space y arrow z proves x arrow z$.
  ]
  we know $beta arrow gamma$.
  Now, observe the following.
  $
    alpha or beta &equiv not not alpha or beta        &&quad #say[by _double negation_] \
                  &equiv not alpha arrow beta         &&quad #say[by _conditional disintegration_] \
                  &equiv not beta arrow not not alpha &&quad #say[by a theorem we proved] \
                  &equiv not beta arrow alpha         &&quad #say[by _double negation_]
  $
  So we know $not beta arrow alpha$ now.
  Again, by the _hypothetical syllogism,_ we can derive $not beta arrow gamma$. \
  Thanks to a theorem we have proven, we know $top$.
  We also know $top equiv not beta or beta$ by _complement,_ so we know $not beta or beta$.

  Now, we have $not beta or beta$, and we know both $beta arrow gamma$ and $not beta arrow gamma$.
  Therefore, we can conclude $gamma$ by _disjunction elimination._
  #marginalis[
    $x or y, space x arrow z, space y arrow z proves z$
  ]
]

#v(1.0fr)

#pagebreak()

// = You may rely on axioms 0 through 6 of set theory and any theorem we have proven in lecture and in problem sets. Logical axioms, rules, and theorems need not be cited.
= The axioms, rules of inference, and theorems of the zeroth-order and first-order logic *need not* be cited. You may assume axioms 0 through 6 of set theory, and you may rely on any theorems proven in lectures, notes, and problem sets.

Show that $forall x forall y (x inter y = emptyset implies x subset x without y)$.

#v(1.0cm)

#proof(number: 1)[
  Let $x$ and $y$ be arbitrary sets, and assume $x inter y = emptyset$.
  Let $t$ be a set, and suppose that $t in x$.
  Recall that $t in.not emptyset$ because $forall w (w in.not emptyset)$.
  Observe the following derivation.
  $
    t in.not emptyset &implies t in.not x inter y &&quad #say[by the _axiom of extensionality_] \
                      &implies not (t in x and t in y) &&quad #say[by definition] \
                      &implies t in.not x or t in.not y
  $
  Since $t in x$, this implies $t in.not y$, and so $t in x without y$ by definition.
  Therefore, $x subset x without y$.
]

#v(1.0fr)

#proof(number: 2)[
  Let $x$ and $y$ be arbitrary sets, and assume $x inter y = emptyset$.
  Towards a contradiction, suppose $x subset.not x without y$.
  By definition, means there exists $t$ such that $t in x$ and $t in.not x without y$.
  Observe the following deduction.
  $
    t in.not x without y &implies not (t in x and t in.not y) &&quad #say[by definition] \
                         &implies t in.not x or t in y

  $
  Since $t in x$, we can deduce that $t in y$.
  Thus, $t in x inter y$ by definition, so $t in emptyset$ by the _axiom of extensionality._
  However, $t in.not emptyset$ because $forall w (w in.not emptyset)$.
  #contradiction

  Therefore, we conclude $x subset x without y$ as desired.
]

#v(1.0fr)

#pagebreak()

= The axioms, rules of inference, and theorems of the zeroth-order and first-order logic *need not* be cited. You may assume axioms 0 through 6 of set theory, and you may rely on any theorems proven in lectures, notes, and problem sets.

Show that $forall x forall y (PP(x) subset PP(y) implies x subset y)$.

#v(1.0cm)

#proof[
  Let $x$ and $y$ be sets, and assume $PP(x) subset PP(y)$.
  Recall that $x subset x$ because we have proven $forall w (w subset w)$.
  Thus, $x in PP(x)$ by definition, so $x in PP(y)$ thanks to our assumption.
  This means $x subset y$ by definition.
]
