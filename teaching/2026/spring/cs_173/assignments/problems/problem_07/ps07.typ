#import "@local/assignment:0.0.1": *

#show: assignment.with(
  author: "Daniel Gonzalez Cedre",
  course: "Discrete Structures",
  type: "problem set",
  number: 7,
  date: datetime(year: 2026, month: 04, day: 17),
)

#let lemma = lemma.with(numbering: false)
#let theorem = theorem.with(numbering: false)
#let corollary = corollary.with(numbering: false)

As always, you may rely on any statement we have previously proven in lectures and problem sets.
You should solve the problems _in order;_ solutions to earlier problems may be applied as theorems in the proofs of later problems, but _not vice versa._
In this problem set, whenever you _define a function,_ you are _*not*_ required to _prove_ that the thing you've defined is in fact a function (as long as you _have_ actually defined a function).
You may also rely on the _Cantor-Schroder-Bernstein_ theorem as stated below.

#theorem(name: "Cantor-Schroder-Bernstein")[
  $forall x forall y ((card(x) lt.eq card(y) and card(y) lt.eq card(x)) implies card(x) = card(y))$.
]

We define a set $X$ to be #define[finite] _iff_ $(exists n in NN)(card(X) = card(n))$, meaning that $X$ can be put in bijection with the set ${0, 1, dots n - 1}$ for some $n in NN$.
In such a situation, we will define the #define[cardinality of $X$] to be $card(X) := n$,
so saying $card(X) in NN$ is equivalent to saying "$X$ is finite."
#apostille[$card(X)$]

Given this definition, you may also rely on the following theorems in this problem set.

#lemma[
  If $X$ is a finite set and $Y$ is a set such that $Y subset X$, then $Y$ is also finite.
]

#theorem[
  For any finite sets $X$ and $Y$, if $Y subset X$, then $card(X without Y) = card(X) - card(Y)$.
]

#corollary[
  For any nonempty finite set $X$, and for any $x in X$, we have $card(X without {x}) = card(X) - 1$.
]

Given sets $A, B, C$ and functions $f: A to B$ and $g: B to C$, we define the #define[composition] of $f$ with $g$ to be the function $g compose f: A to C$ given by $(g compose f)(a) := g(f(a))$ for all $a in A$.
#apostille[$g compose f$]

#v(1.0em)

1. 

  + Show that $forall X forall Y (X subset Y implies card(X) lt.eq card(Y))$.

  + Let $X$ and $Y$ be sets such that $X eq.not emptyset$ and $Y eq.not emptyset$,
    and let $f: X to Y$ be an injection.
    Prove that there exists a function $g: Y to X$ such that $g compose f = id_X$.
    #marginalis[
      This problem is asking you to prove that every injective function has a left inverse.
      The dual statement---every surjective function has a right inverse---is equivalent to the _axiom of choice._
    ]

// 2. Let $A$, $B$, and $C$ be sets, and consider two arbitrary functions $f: A to B$ and $g: B to C$.

//   + Prove that, if $f$ and $g$ are both injections, then $g compose f$ is an injection.

//   + Prove that, if $f$ and $g$ are both surjections, then $g compose f$ is a surjection.

//   + Prove that, if $f$ and $g$ are both bijections, then $g compose f$ is a bijection.

2. 

  + Prove that $forall A forall B forall C ((card(A) lt.eq card(B) and card(B) lt.eq card(C)) implies card(A) lt.eq card(C))$.

  + Prove that $forall A forall B forall C ((card(A) gt.eq card(B) and card(B) gt.eq card(C)) implies card(A) gt.eq card(C))$.

  + Prove that $forall A forall B forall C ((card(A) = card(B) and card(B) = card(C)) implies card(A) = card(C))$.

3. For any finite sets $A$ and $B$,
  prove that $card(A union B) = card(A) + card(B)$ when $A inter B = emptyset$.
// 3. Prove for any finite sets $A$ and $B$ that $card(A union B) + card(A inter B) = card(A) + card(B)$.
// 3. Let $A$ and $B$ be sets such that $card(A) = n$ and $card(B) = m$ for some $n, m in NN$.
  // Prove that $card(A union B) = $.

4. For any finite set $X$, show that $card(PP(X)) = 2^card(X)$.
  #marginalis[
    _Hint:_ try induction.
  ]
