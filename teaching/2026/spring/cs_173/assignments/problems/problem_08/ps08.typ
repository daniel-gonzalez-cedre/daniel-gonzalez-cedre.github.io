#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "problem set",
  number: 8,
  date: datetime(year: 2026, month: 04, day: 29),
)

#let definition = definition.with(numbering: false)
#let lemma = lemma.with(numbering: false)
#let theorem = theorem.with(numbering: false)
#let corollary = corollary.with(numbering: false)

As always, you may rely on any statement we have previously proven in lectures and problem sets.
You should solve the problems _in order;_ solutions to earlier problems may be applied as theorems in the proofs of later problems, but _not vice versa._

When you _define a function_ in this problem set, you are _*not*_ required to _prove_ what you've defined is in fact a function (as long as you _have_ actually defined a function).

// You may also rely on the following theorems.

// #theorem(name: "Cantor-Schroder-Bernstein")[
//   $forall x forall y ((card(x) lt.eq card(y) and card(y) lt.eq card(x)) implies card(x) = card(y))$.
// ]

// // We define a set $X$ to be #define[finite] iff $(exists n in NN)(card(X) = card(n))$, meaning that $X$ can be put in bijection with the set ${0, 1, dots n - 1}$ for some $n in NN$.
// // In such a situation, we will define the #define[cardinality of $X$] to be $card(X) := n$,
// // so saying $card(X) in NN$ is equivalent to saying "$X$ is finite."
// // #apostille[$card(X)$]

// #theorem[
//   If $X$ is a finite set and $Y$ is a set such that $Y subset X$, then $Y$ is also finite.
// ]

// #theorem[
//   For any finite sets $X$ and $Y$, if $Y subset X$, then $card(X without Y) = card(X) - card(Y)$.
// ]

// #theorem(name: "Pigeonhole Theorem")[
//   Let $X$ and $Y$ be sets.
//   The following three statements then hold.
//   // - If $card(X) gt card(Y)$, then $forall f (f: X to Y implies f #say[is not injective])$.
//   - If $card(X) gt card(Y)$, then none of the functions $f: X to Y$ are injective.
//   - If $card(X) lt card(Y)$, then none of the functions $f: X to Y$ are surjective.
//   - If $X$ and $Y$ are both finite, then $(forall f: X to Y)(exists y in Y)(card({x in X st f(x) = y}) gt.eq ceil(card(Y)/card(X)))$.
// ]

#definition(name: "Binomial Coefficients")[
  Let $n in NN$ and consider an arbitrary finite set $cal(A)$ of cardinality $card(cal(A)) = n$.
  We will represent by $binom(n, k)$ the number of subsets of $cal(A)$ of cardinality $k$.
  We define this formally below.
  $
    binom(n, k) := card({cal(B) st cal(B) subset cal(A) and card(cal(B)) = k})
                 = card({cal(B) st cal(B) subset n      and card(cal(B)) = k})
  $
]

You may rely on the axiom of _trichotomy of cardinality_
#marginalis[For any $A$, $B$, either $card(A) lt card(B)$, or $card(A) gt card(B)$, or $card(A) = card(B)$.]
and the following theorems.

#theorem[
  $forall A forall B (card(A) lt.eq card(B) iff card(B) gt.eq card(A))$.
]

#theorem[
  For any sets $cal(F)$ and $cal(I)$,
  if $cal(F)$ is finite and $cal(I)$ is infinite,
  then $card(cal(F)) lt card(cal(I))$.
]

#theorem[
  $NN$ is infinite.
  Additionally,
  $card(NN) = card(NN_+) = card(ZZ) = card(QQ)$ and
  $card(NN) = card(NN times NN) = card(ZZ times ZZ)$.
]

#corollary[
  For every $n in NN$, we have $card(NN) = card(NN without {k in NN st k lt n})$.
]

#v(1.0em)

// 1. There are currently a total of $632$ students enrolled for the 2026 Spring semester of #mono("CS173") at the University of Illinois Urbana-Champaign.
//   Prove that two of these students must have been born on the same day of the year.

1. An archaeologist on a recent expedition to the British isles has discovered, for each positive natural number $n in NN_+$, evidence of a manuscript written in a language called $n$glish---believed to be used by the native inhabitants of $n$gland in ancient times.
  Each such manuscript is exactly $n$ pages long and contains precisely $2n$ distinct words.
  Prove each manuscript contains a page with two distinct words on it.

2. Show that there exist $a, b in NN$ such that $256 lt a lt b$ and $7^a equiv 7^b (mod 512)$.

3. Consider the set $cal(S) := {3, 4, 7, 8, 9, 10, 12, 15, 18, 19, 27, 28}$.
  Show that, in any subset $cal(X) subset cal(S)$ of cardinality $card(cal(X)) gt.eq 9$,
  there exist three _distinct_ elements $x_1, x_2, x_3 in cal(X)$ such that $x_1 + x_2 + x_3 = 40$.

4. For this problem, you may assume that $binom(n, 0) = binom(n, n) = 1$ for all $n in NN$.
  Prove that, for every $n, k in NN$ such that $k lt.eq n$, we have $binom(n, k) = binom(n, n - k)$.

  // + For every $n, k in NN$, prove that $binom(n, k) = binom(n, n - k)$ when $k lt.eq n$.

  // + For every $n, k in NN$, prove that $binom(n + 1, k + 1) = binom(n, k + 1) + binom(n, k)$ when $k lt.eq n$.

5. We define a #define[finite binary string] to be a function $b: n to {0, 1}$,
  where $n in NN$ is the length of the string.
  We define an #define[infinite binary string] to be a function $b: NN to {0, 1}$. \
  How many infinite binary strings are there that each contain one contiguous finite substring consisting only of $1$s?
  Formalize your claim and justify it with a proof.
