#import "@local/exam:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "fp",
  date: datetime(year: 2026, month: 05, day: 09),
  paper_color: "bleached"
)

#let option = box(circle(radius: 3.6pt, stroke: color.off.black + 0.6pt, fill: none))
#let answer = box(circle(radius: 3.6pt, stroke: color.off.black + 0.6pt, fill: color.off.black))

= Answer each of the following questions by marking True or False but not both.

1. If $a$ and $b$ are odd, then $(forall c in ZZ)(c^2 = a^2 + b^2)$.

  #option _True_ \
  #option _False_

2. If this statement has a truth value, then every countable set is finite.

  #option _True_ \
  #option _False_

3. Every graph must contain an even number of even-degree vertices.

  #option _True_ \
  #option _False_

4. There exist $x, y in ZZ without {0}$ such that $5 divides x$ and $5 divides y$ and $gcd(x, y) lt 5$.

  #option _True_ \
  #option _False_

5. $forall x forall y (x subset y iff PP(X) subset PP(y))$.

  #option _True_ \
  #option _False_

6. For any set $A$, there exists $B subset A$ such that $card(A without B) = card(A)$.

  #option _True_ \
  #option _False_

// 7. There are as many well-formed formulæ as there are natural numbers.
7. There are as many propositions as there are natural numbers.

  #option _True_ \
  #option _False_

8. If $n in NN$ and a graph $G$ has $n$ nodes and $n - 1$ edges, then $G$ is connected.

  #option _True_ \
  #option _False_

9. There exists $x in ZZ$ such that $16 x equiv 50 space (mod 7)$.

  #option _True_ \
  #option _False_

10. There is a tree $T$ such that $card(V(T))$ and $card(E(T))$ are both prime numbers greater than 2.

  #option _True_ \
  #option _False_

#pagebreak()

= Answer each of the following questions without proof.

1. #box(width: 100.0%, height: 17.5%, stroke: (bottom: 0.6pt))[
    Let $T := {t st (exists n in NN)(t: n to {0, 1, 2})}$.
    Provide an explicit bijection $phi: T to NN$.
  ]
  // #marginale[#box[#line(length: 100.0%)]]

2. #box(width: 100.0%, height: 17.5%, stroke: (bottom: 0.6pt))[
    Give an example of an $in$-transitive set that is not a natural number.
  ]
  // #marginale[#box[#line(length: 100.0%)]]

3. #box(width: 100.0%, height: 17.5%, stroke: (bottom: 0.6pt))[
    Give an example of an uncountable set $X$ such that $forall Y (X eq.not PP(Y))$.
  ]
  // #marginale[#box[#line(length: 100.0%)]]

4. #box(width: 100.0%, height: 17.5%, stroke: (bottom: 0.6pt))[
    Given a positive natural number $n in NN_+$,
    what is the _minimum_ number of edges a connected graph on $n$ nodes can have?
  ]
  // #marginale[#box[#line(length: 100.0%)]]

5. #box(width: 100.0%, height: 17.5%, stroke: (bottom: 0.6pt))[
    Give an example of a connected graph $G$ for which $3$ is the _minimum_ number of edges whose removal would disconnect $G$.
  ]
  // #marginale[#box[#line(length: 100.0%)]]

#pagebreak()

= The axioms, rules of inference, and theorems of the zeroth-order and first-order logic *must* be explicitly cited (by name, if possible) when used.

Prove the statement below for any propositions $p$ and $q$.
$
  proves (not q and (p arrow q)) arrow not p
$

#pagebreak()

= You may assume all axioms and theorems we have discussed so far, including any basic arithmetic and algebraic properties of $NN$, $ZZ$, $QQ$, and $RR$.

Use induction to prove that $(forall n in NN)(n gt.eq 4 implies (exists x, y in ZZ)(2x + 5y = n))$.

#pagebreak()

= You may assume all axioms and theorems we have discussed so far, including any basic arithmetic and algebraic properties of $NN$, $ZZ$, $QQ$, and $RR$.

Prove that there are infinitely many finite binary strings.

// For this problem, you may assume that any positive natural number $n in NN_+$ can be written as $n = 2^ell dot k$, where $k$ is odd and $ell, k in NN$.
// You may also assume, for all $n in NN_+$, that there are exactly $n$ odd numbers in the set ${x in NN st 1 lt.eq x lt.eq 2n}$.

// For all $n in NN_+$, prove that any subset $A subset {x in NN st 1 lt.eq x lt.eq 2n}$ such that $card(A) = n + 1$ must contain two distinct elements $x eq.not y$ such that $x divides y$.
// // $forall A ((A subset {x in NN st 1 lt.eq x lt.eq 2n} and card(A) = n + 1) implies (exists x, y in A)(x eq.not y and x divides y))$.

#pagebreak()

= You may assume all axioms and theorems we have discussed so far, including any basic arithmetic and algebraic properties of $NN$, $ZZ$, $QQ$, and $RR$.

Use induction to prove that any connected graph contains a spanning tree.
